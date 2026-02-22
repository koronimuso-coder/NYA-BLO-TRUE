# 🚀 NYA BLO - QUICK START GUIDE

## ⚡ Installation en 2 étapes

### Étape 1: Installer les dépendances
```
Double-clic sur: INSTALL.bat
```

**Ce qui sera installé**:
- ✅ Next.js 16.1.6 (Framework React)
- ✅ React 19 (UI Library)
- ✅ Three.js 0.171 (3D WebGL/WebGPU)
- ✅ @react-three/fiber (Three.js pour React)
- ✅ @react-three/drei (Helpers 3D)
- ✅ GSAP 3.14 (Animations)
- ✅ Framer Motion 12 (Animations React)
- ✅ Firebase 12 (Backend/Auth)
- ✅ Lucide Icons (Icônes)
- ✅ Tailwind CSS 4 (Styling)

**Temps estimé**: 2-5 minutes selon connexion internet

---

### Étape 2: Lancer l'application
```
Double-clic sur: START.bat
```

**Ouverture automatique**: http://localhost:3000

---

## 📁 Structure des Fichiers

```
NYA BLO/
│
├── INSTALL.bat              ← Installer dépendances (1× uniquement)
├── START.bat                ← Lancer serveur dev
│
├── apps/web/
│   ├── package.json         ← Liste des packages
│   ├── src/
│   │   ├── app/            ← Pages Next.js
│   │   ├── components/     ← Composants React
│   │   ├── lib/            ← Logique métier
│   │   └── styles/         ← CSS & Tailwind
│   └── public/             ← Assets statiques
│
├── TECH_STACK.md           ← Documentation tech
├── REVOLUTIONARY_TECH.md   ← Technologies avancées
└── FIX_LANGCHAIN.md        ← Fix agent AI
```

---

## 🌐 Pages Disponibles

| URL | Description | Fonctionnalités |
|-----|-------------|-----------------|
| `/` | Homepage | 3D Sirius + Voice AI + Animations |
| `/shop` | Market | E-commerce avec filtres |
| `/cv-builder` | CV Builder | ATS Scoring temps réel |
| `/digital-twin` | Digital Twin | Simulations business IA |
| `/tech-stack` | Tech Showcase | Pitch investisseurs |
| `/advanced-tech` | Index Tech | Vue d'ensemble technologies |

---

## 🔧 Commandes Utiles

### Installation
```bash
# Méthode 1: Script automatique
INSTALL.bat

# Méthode 2: Manuel
cd apps/web
npm install
```

### Développement
```bash
# Méthode 1: Script
START.bat

# Méthode 2: Manuel
cd apps/web
npm run dev
```

### Build Production
```bash
cd apps/web
npm run build
npm start
```

### Nettoyage
```bash
cd apps/web
rmdir /s /q node_modules
del package-lock.json
npm install
```

---

## ⚠️ Résolution de Problèmes

### Erreur: "pnpm not found"
**Solution**: Utiliser npm à la place
```bash
npm install
npm run dev
```

### Erreur: "Execution Policy"
**Solution**: Lancer PowerShell en Administrateur
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Erreur: "Module not found: three"
**Solution**: Relancer l'installation
```bash
INSTALL.bat
```

### Erreur: Port 3000 déjà utilisé
**Solution**: Changer le port
```bash
# Méthode 1
set PORT=3001 && npm run dev

# Méthode 2: Tuer le processus
npx kill-port 3000
npm run dev
```

### Build échoue
**Solution**: Vérifier Node.js version
```bash
node --version  # Doit être >= 18.0.0
npm --version   # Doit être >= 9.0.0

# Si trop ancien, télécharger depuis nodejs.org
```

---

## 🎯 Checklist de Premier Lancement

- [ ] Node.js installé (v18+)
- [ ] Double-clic `INSTALL.bat` (attendre fin)
- [ ] Vérifier `apps/web/node_modules` existe
- [ ] Double-clic `START.bat`
- [ ] Ouvrir http://localhost:3000
- [ ] Tester page homepage (3D doit charger)
- [ ] Naviguer vers `/shop`
- [ ] Tester `/cv-builder`
- [ ] Explorer `/digital-twin`

---

## 📊 Métriques de Performance Attendues

| Métrique | Valeur Cible | Comment Vérifier |
|----------|--------------|------------------|
| First Load | < 2s | Ouvrir DevTools > Network |
| 3D FPS | 60-120 FPS | Activer stats trois.js |
| Lighthouse | 90+ | Chrome DevTools > Lighthouse |
| Bundle Size | < 500KB | `npm run analyze` |

---

## 🚀 Déploiement Vercel

### Méthode 1: Via GitHub
```bash
# 1. Push sur GitHub
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/VOTRE_USERNAME/nya-blo.git
git push -u origin main

# 2. Sur vercel.com
# - Import repository
# - Framework: Next.js
# - Root directory: apps/web
# - Deploy
```

### Méthode 2: CLI
```bash
npm install -g vercel
cd apps/web
vercel
# Suivre les instructions
```

---

## 🔑 Variables d'Environnement (Optionnel)

Créer `apps/web/.env.local`:

```env
# OpenAI (pour AI agents avancés)
OPENAI_API_KEY=sk-...
NEXT_PUBLIC_OPENAI_API_KEY=sk-...

# Firebase (déjà configuré dans le code)
NEXT_PUBLIC_FIREBASE_API_KEY=...
NEXT_PUBLIC_FIREBASE_PROJECT_ID=...

# Vercel Edge (auto-configuré sur Vercel)
KV_REST_API_URL=...
KV_REST_API_TOKEN=...
```

---

## 📚 Documentation Supplémentaire

- **Tech Stack complet**: `TECH_STACK.md`
- **Technologies révolutionnaires**: `REVOLUTIONARY_TECH.md`
- **Fix LangChain**: `FIX_LANGCHAIN.md`
- **Dépendances référence**: `DEPENDENCIES_REFERENCE.json`

---

## 🆘 Support

**Problème persiste** ?

1. Vérifier logs dans terminal
2. Consulter `FIX_LANGCHAIN.md`
3. Essayer nettoyage complet:
   ```bash
   cd apps/web
   rmdir /s /q node_modules .next
   del package-lock.json
   npm cache clean --force
   npm install
   npm run dev
   ```

---

## ✨ Fonctionnalités Clés à Tester

### 1. IA Prédictive (Auto)
- Naviguez sur n'importe quelle page
- Attendez 5-10 secondes
- Un banner personnalisé devrait apparaître

### 2. Recherche Vocale (Homepage)
- Cliquez sur le bouton micro (ShowcaseSirius)
- Dites "Recommande-moi quelque chose de sacré"
- L'IA répond avec un produit

### 3. CV Builder AI
- Allez sur `/cv-builder`
- Remplissez le formulaire
- Observez le score ATS changer en temps réel (sidebar droite sur XL)

### 4. Digital Twin
- Allez sur `/digital-twin`
- Observez les métriques en temps réel
- Cliquez "Promo Flash -30%" pour simuler

### 5. 3D WebGPU
- Homepage: scène 3D avec 10K+ particules
- Devrait tourner à 60-120 FPS

---

**Prêt à conquérir l'Afrique avec la tech FAANG !** 🌍🚀✨
