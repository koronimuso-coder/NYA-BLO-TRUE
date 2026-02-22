# 🔥 Firebase Integration - NYA BLO

## ✅ Configuration Complète

Firebase est maintenant **100% configuré** pour NYA BLO avec:

- ✅ **Authentication** (Email/Password + Google)
- ✅ **Firestore Database** (NoSQL cloud)
- ✅ **Storage** (Files & Images)  
- ✅ **Analytics** (Tracking événements)

---

## 📦 Fichiers Créés

| Fichier | Description |
|---------|-------------|
| `lib/firebase/config.ts` | Configuration principale + initialisation |
| `lib/firebase/firestore.ts` | CRUD operations + helpers métier |
| `lib/firebase/analytics.ts` | Tracking événements utilisateurs |
| `hooks/useAuth.ts` | Hook React pour authentification |
| `.env.local.example` | Template variables d'environnement |

---

## 🔐 Authentication

### Utilisation du Hook

```typescript
import { useAuth } from '@/hooks/useAuth';

function MyComponent() {
    const { user, loading, signIn, signUp, signInWithGoogle, signOut } = useAuth();

    // Sign up
    await signUp('user@example.com', 'password123');

    // Sign in
    await signIn('user@example.com', 'password123');

    // Google sign in
    await signInWithGoogle();

    // Sign out
    await signOut();

    if (loading) return <div>Loading...</div>;
    if (!user) return <div>Not logged in</div>;

    return <div>Welcome {user.email}</div>;
}
```

---

## 📊 Firestore Database

### Collections Disponibles

```typescript
import { userService, orderService, cvService } from '@/lib/firebase/firestore';

// Users
await userService.get(userId);
await userService.create(userId, { name: 'John', email: 'john@nya-blo.com' });
await userService.update(userId, { premium: true });

// Orders
await orderService.getByUser(userId);
await orderService.create({
    userId,
    items: [...],
    total: 50000,
});

// CVs
await cvService.getByUser(userId);
await cvService.save(cvId, cvData);
```

### Generic CRUD

```typescript
import { 
    getDocument, 
    getDocuments, 
    setDocument, 
    updateDocument, 
    deleteDocument 
} from '@/lib/firebase/firestore';

// Get single document
const user = await getDocument('users', userId);

// Get multiple documents with filters
import { where, orderBy } from 'firebase/firestore';
const orders = await getDocuments('orders', [
    where('userId', '==', userId),
    orderBy('createdAt', 'desc')
]);

// Create/update
await setDocument('users', userId, { name: 'Alice' });

// Update
await updateDocument('users', userId, { premium: true });

// Delete
await deleteDocument('users', userId);
```

---

## 📈 Analytics Tracking

### E-commerce

```typescript
import analytics from '@/lib/firebase/analytics';

// View product
analytics.ecommerce.viewProduct(
    'prod_123',
    'Sceau Sirius B',
    1250000
);

// Add to cart
analytics.ecommerce.addToCart(
    'prod_123',
    'Sceau Sirius B',
    1250000,
    1
);

// Purchase
analytics.ecommerce.purchase(
    'order_456',
    1250000,
    [{ id: 'prod_123', name: 'Sceau Sirius B', price: 1250000 }]
);
```

### AI Interactions

```typescript
// Chat message
analytics.ai.chatMessage('product_curator', 'Cherche art sacré');

// Voice command
analytics.ai.voiceCommand('Recommande-moi quelque chose', 0.95);

// Predictive action
analytics.ai.predictiveAction('show_exit_offer', 0.85, true);
```

### 3D/AR Features

```typescript
// AR session
analytics.immersive.arSessionStart('prod_123');

// WebGPU loaded
analytics.immersive.webgpuLoaded(10000, 120);
```

### CV Builder

```typescript
// CV created
analytics.cv.created('dogon_template');

// CV downloaded
analytics.cv.downloaded('pdf', 85);

// AI analysis
analytics.cv.aiAnalysis(85, 5);
```

### Page Views

```typescript
import { trackPageView } from '@/lib/firebase/analytics';

// In page components
useEffect(() => {
    trackPageView(window.location.pathname);
}, []);
```

---

## 🗂️ Storage (Upload Files)

```typescript
import { storage } from '@/lib/firebase/config';
import { ref, uploadBytes, getDownloadURL } from 'firebase/storage';

async function uploadFile(file: File, userId: string) {
    // Create reference
    const storageRef = ref(storage, `users/${userId}/${file.name}`);
    
    // Upload
    await uploadBytes(storageRef, file);
    
    // Get download URL
    const url = await getDownloadURL(storageRef);
    
    return url;
}

// Usage
const cvPdfUrl = await uploadFile(pdfFile, user.uid);
```

---

## 🔒 Security Rules (À configurer sur Firebase Console)

### Firestore Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users: can only read/write own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Products: public read, admin write
    match /products/{productId} {
      allow read: if true;
      allow write: if request.auth != null && get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'admin';
    }
    
    // Orders: users can read their own
    match /orders/{orderId} {
      allow read: if request.auth != null && 
                     resource.data.userId == request.auth.uid;
      allow create: if request.auth != null && 
                       request.resource.data.userId == request.auth.uid;
    }
    
    // CVs: users can read/write their own
    match /cvs/{cvId} {
      allow read, write: if request.auth != null && 
                            resource.data.userId == request.auth.uid;
    }
  }
}
```

### Storage Rules

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    // User files
    match /users/{userId}/{allPaths=**} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Public assets
    match /public/{allPaths=**} {
      allow read: if true;
    }
  }
}
```

---

## 🎯 Intégration dans les Composants

### Exemple: Page avec Auth

```typescript
"use client";

import { useAuth } from '@/hooks/useAuth';
import { useEffect } from 'react';
import { trackPageView } from '@/lib/firebase/analytics';

export default function ProfilePage() {
    const { user, loading, signOut } = useAuth();

    useEffect(() => {
        trackPageView('/profile');
    }, []);

    if (loading) {
        return <div>Chargement...</div>;
    }

    if (!user) {
        return <div>Vous devez être connecté</div>;
    }

    return (
        <div>
            <h1>Profil de {user.email}</h1>
            <button onClick={signOut}>
                Se déconnecter
            </button>
        </div>
    );
}
```

### Exemple: E-commerce avec Firebase

```typescript
"use client";

import { ecommerceTracking } from '@/lib/firebase/analytics';
import { orderService } from '@/lib/firebase/firestore';
import { useAuth } from '@/hooks/useAuth';

export function ProductCard({ product }: { product: any }) {
    const { user } = useAuth();

    const handleView = () => {
        ecommerceTracking.viewProduct(
            product.id,
            product.name,
            product.price
        );
    };

    const handleAddToCart = async () => {
        ecommerceTracking.addToCart(
            product.id,
            product.name,
            product.price,
            1
        );

        // Save to Firestore
        if (user) {
            await orderService.create({
                userId: user.uid,
                productId: product.id,
                quantity: 1,
                total: product.price,
            });
        }
    };

    useEffect(() => {
        handleView();
    }, []);

    return (
        <div>
            <h3>{product.name}</h3>
            <p>{product.price} XOF</p>
            <button onClick={handleAddToCart}>
                Ajouter au panier
            </button>
        </div>
    );
}
```

---

## 🚀 Prochaines Étapes

### 1. Vérifier la Configuration

Allez sur [Firebase Console](https://console.firebase.google.com/project/nya-blo):

- ✅ Authentication activée
- ✅ Firestore Database créée
- ✅ Storage activé
- ✅ Analytics configuré

### 2. Configurer les Security Rules

- Copier/coller les rules ci-dessus
- Adapter selon vos besoins

### 3. Tester

```typescript
// Test auth
const { signUp } = useAuth();
await signUp('test@nya-blo.com', 'password123');

// Test firestore
await setDocument('test', 'doc1', { hello: 'world' });

// Test analytics
logEvent('test_event', { foo: 'bar' });
```

---

## 📚 Ressources

- [Firebase Docs](https://firebase.google.com/docs)
- [Firestore Guide](https://firebase.google.com/docs/firestore)
- [Analytics Events](https://firebase.google.com/docs/analytics/events)

---

**Firebase est maintenant prêt pour NYA BLO !** 🔥✨
