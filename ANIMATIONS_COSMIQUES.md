# 🌌 Système d'Animations Cosmiques NYA BLO

## Vue d'ensemble

Le système d'animations cosmiques NYA BLO est basé sur la **cosmogonie Dogon** et représente :
- **Sirius A** (étoile principale) - Or solaire `#F6C000`
- **Po Tolo** (Sirius B, naine blanche) - Blanc pur `#FFFFFF`
- **Emme Ya** (Sirius C) - Turquoise `#21E0C1`
- **Nommo** (êtres amphibiens) - Ochre `#B3541E`

---

## 📦 Composants disponibles

### 1. **CosmicBackground** (Fond animé)

Fond d'écran animé avec particules cosmiques et orbites. **Déjà intégré dans le layout global**.

```tsx
import { CosmicBackground } from '@/components/cosmic';

// Déjà présent dans layout.tsx - rien à faire !
```

---

### 2. **PageTransition** (Transitions de page)

4 variants de transition :
- `fade` - Apparition simple
- `nommo-rise` - Montée depuis les profondeurs (défaut, recommandé)
- `spiral` - Rotation galactique
- `Portal-open` - Ouverture dimensionnelle

```tsx
import { PageTransition } from '@/components/cosmic';

export default function MaPage() {
  return (
    <PageTransition variant="nommo-rise">
      <div>Mon contenu</div>
    </PageTransition>
  );
}
```

---

### 3. **StaggerContainer & StaggerItem** (Animation en cascade)

Pour animer plusieurs éléments successivement :

```tsx
import { StaggerContainer, StaggerItem } from '@/components/cosmic';

<StaggerContainer staggerDelay={0.1}>
  <StaggerItem>
    <h1>Titre 1</h1>
  </StaggerItem>
  <StaggerItem>
    <h2>Titre 2</h2>
  </StaggerItem>
  <StaggerItem>
    <p>Paragraphe</p>
  </StaggerItem>
</StaggerContainer>
```

---

### 4. **ScrollReveal** (Révélation au scroll)

Apparition progressive lors du scroll :

```tsx
import { ScrollReveal } from '@/components/cosmic';

<ScrollReveal delay={0.2}>
  <div>Ce contenu apparaît au scroll</div>
</ScrollReveal>
```

---

### 5. **CosmicRotate** (Rotation orbitale)

Rotation continue (représente les orbites de Sirius) :

```tsx
import { CosmicRotate } from '@/components/cosmic';

<CosmicRotate duration={20} reverse={false}>
  <div className="w-64 h-64 border rounded-full">
    Tourne !
  </div>
</CosmicRotate>
```

Props :
- `duration` - Durée en secondes (défaut: 20)
- `reverse` - Sens inverse (défaut: false)

---

### 6. **CosmicPulse** (Pulsation)

Effet de battement de cœur cosmique :

```tsx
import { CosmicPulse } from '@/components/cosmic';

<CosmicPulse scale={[1, 1.1]} duration={2}>
  <div className="w-32 h-32 bg-gold rounded-full">
    Pulse !
  </div>
</CosmicPulse>
```

Props :
- `scale` - Échelle min/max (défaut: [1, 1.05])
- `duration` - Durée du cycle (défaut: 2)

---

### 7. **AntiGravityFloat** (Flottement antigravité)

Mouvement flottant comme en apesanteur :

```tsx
import { AntiGravityFloat } from '@/components/cosmic';

<AntiGravityFloat intensity={20}>
  <div>Élément flottant</div>
</AntiGravityFloat>
```

Props :
- `intensity` - Amplitude du mouvement (défaut: 20)

---

### 8. **SpiralReveal** (Apparition spiralée)

Révélation en spirale (création Nommo) :

```tsx
import { SpiralReveal } from '@/components/cosmic';

<SpiralReveal>
  <div>Apparaît en tournant !</div>
</SpiralReveal>
```

---

### 9. **ScrollParallax** (Parallaxe scroll)

Effet de profondeur au scroll :

```tsx
import { ScrollParallax } from '@/components/cosmic';

<ScrollParallax offset={50}>
  <div>Se déplace avec le scroll</div>
</ScrollParallax>
```

Props :
- `offset` - Décalage en pixels (défaut: 50)

---

## 🎨 Exemples d'utilisation complète

### Page standard avec tous les effets

```tsx
"use client";

import { 
  PageTransition, 
  StaggerContainer, 
  StaggerItem,
  ScrollReveal,
  CosmicPulse,
  AntiGravityFloat
} from '@/components/cosmic';

export default function MaSuperPage() {
  return (
    <PageTransition variant="nommo-rise">
      <div className="min-h-screen pt-32 pb-20">
        
        {/* Hero avec animation cascade */}
        <StaggerContainer className="max-w-7xl mx-auto px-6 text-center">
          <StaggerItem>
            <CosmicPulse>
              <h1 className="text-8xl font-black text-white">
                Mon Titre
              </h1>
            </CosmicPulse>
          </StaggerItem>
          
          <StaggerItem>
            <p className="text-xl text-gray-400">
              Mon sous-titre
            </p>
          </StaggerItem>
          
          <StaggerItem>
            <button className="px-12 py-5 bg-gold rounded-full">
              CTA Button
            </button>
          </StaggerItem>
        </StaggerContainer>

        {/* Section révélée au scroll */}
        <ScrollReveal>
          <section className="max-w-7xl mx-auto px-6 py-20">
            <h2>Ma section</h2>
            
            {/* Éléments flottants */}
            <div className="flex gap-8">
              <AntiGravityFloat intensity={30}>
                <div className="w-24 h-24 bg-gold rounded-2xl" />
              </AntiGravityFloat>
              <AntiGravityFloat intensity={25}>
                <div className="w-20 h-20 bg-turquoise rounded-full" />
              </AntiGravityFloat>
            </div>
          </section>
        </ScrollReveal>

      </div>
    </PageTransition>
  );
}
```

---

## 🚀 Page de démonstration

Pour voir toutes les animations en action :

**URL : `http://localhost:3000/cosmic-demo`**

---

## 💡 Bonnes pratiques

1. **Toujours** wrapper vos pages dans `<PageTransition>`
2. Utiliser `StaggerContainer` pour les héros multi-éléments
3. `ScrollReveal` pour les sections importantes
4. `CosmicPulse` sur les CTAs et éléments importants
5. `AntiGravityFloat` pour les éléments décoratifs
6. `CosmicRotate` pour les logos/icônes circulaires

---

## 🎯 Performance

- Toutes les animations utilisent CSS transforms (GPU accelerated)
- `will-change` automatique via Framer Motion
- Pas d'impact sur le Web Vitals
- Compatible mobile/desktop

---

## 🌟 Cosmogonie Dogon - Signification

- **Sirius A** = Source de vie, étoile principale
- **Po Tolo (Sirius B)** = Graine primordiale, origine
- **Emme Ya (Sirius C)** = Compagne féminine, équilibre
- **Nommo** = Créateurs amphibiens, messagers

Chaque animation représente un aspect de cette cosmologie millénaire.
