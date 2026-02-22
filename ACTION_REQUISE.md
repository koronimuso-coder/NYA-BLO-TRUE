# 🚨 ACTION REQUISE - Installer les Dépendances

## ❌ Problème Actuel
```
Module not found: Can't resolve 'three'
```

**Cause**: Les packages npm n'ont pas encore été installés.

---

## ✅ SOLUTION RAPIDE (3 étapes)

### Étape 1: Débloquer PowerShell

**Ouvrir PowerShell en Administrateur**:
1. Clic droit sur Windows Start
2. Cliquer "Windows PowerShell (Admin)" ou "Terminal (Admin)"
3. Taper cette commande:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

4. Appuyer **Y** puis **Entrée**

✅ **PowerShell est maintenant débloqué**

---

### Étape 2: Installer les Packages

**Dans PowerShell normal** (pas admin):

```powershell
cd "c:\Users\NYAMMA\NYA BLO\apps\web"
npm install
```

⏱️ **Attendre 2-5 minutes** (installation de ~50 packages)

---

### Étape 3: Lancer l'Application

```powershell
npm run dev
```

🌐 **Ouvrir**: http://localhost:3000

---

## 🎯 Alternative Plus Simple

**Si PowerShell Admin difficile d'accès**:

1. Double-clic sur: `FIX_INSTALL.bat`
2. Attendre fin installation
3. Double-clic sur: `START.bat`

---

## 🔍 Vérifier Installation Réussie

Après installation, vérifier:

```cmd
dir "apps\web\node_modules\three"
```

Si des fichiers s'affichent → ✅ **Installé correctement**

---

## 📊 Ce qui sera installé

```
✅ three@0.171.0                    (~500KB)
✅ @react-three/fiber@8.17.0        (~100KB)
✅ @react-three/drei@9.117.0        (~200KB)
✅ @types/three@0.171.0             (~50KB)
✅ + 40+ autres packages            (~50MB total)
```

**Temps total**: 2-5 minutes

**Espace disque**: ~300MB

---

## ⚠️ Si Erreur Persiste

### Erreur: "PowerShell policy"
→ Voir `FIX_POWERSHELL_ERROR.md`

### Erreur: "npm not found"
→ Installer Node.js depuis https://nodejs.org/

### Erreur: "EACCES" ou "permission denied"
→ Lancer terminal en Administrateur

### Erreur: "ECONNREFUSED"
→ Vérifier connexion internet

---

## 🎉 Après Installation

Une fois `npm install` terminé sans erreur:

✅ L'erreur "Can't resolve 'three'" disparaît
✅ Le build fonctionne
✅ L'application démarre
✅ La 3D WebGPU s'affiche

---

## 🚀 Séquence Complète

```powershell
# 1. PowerShell Admin
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# 2. PowerShell normal
cd "c:\Users\NYAMMA\NYA BLO\apps\web"
npm install

# 3. Vérifier
dir node_modules\three

# 4. Lancer
npm run dev

# 5. Ouvrir navigateur
start http://localhost:3000
```

---

## 📞 Besoin d'Aide ?

Consulter dans l'ordre:
1. `FIX_POWERSHELL_ERROR.md` - Problème PowerShell
2. `QUICK_START.md` - Guide installation complet
3. `README.md` - Vue d'ensemble

---

**L'installation des packages résoudra TOUTES les erreurs "Module not found".** ✨

**Temps estimé**: 5 minutes maximum ⏱️
