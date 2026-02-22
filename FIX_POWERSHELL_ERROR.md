# 🚨 ERREUR: Politique d'Exécution PowerShell

## Problème
```
npm: File C:\Program Files\nodejs\npm.ps1 cannot be loaded 
because running scripts is disabled on this system.
```

## 🔧 Solutions (Choisir UNE méthode)

### ✅ **Solution 1**: Script FIX_INSTALL.bat (Plus Simple)

```bash
# Double-clic sur:
FIX_INSTALL.bat
```

Ce script contourne le problème PowerShell en utilisant `cmd`.

---

### ✅ **Solution 2**: Débloquer PowerShell (Recommandé)

**Étapes**:

1. **Clic droit** sur l'icône Windows (menu Démarrer)
2. Sélectionner **"Windows PowerShell (Administrateur)"** ou **"Terminal (Administrateur)"**
3. Dans la fenêtre PowerShell, taper:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

4. Appuyer sur **"Y"** (Oui) puis **Entrée**
5. Fermer PowerShell
6. Relancer depuis un PowerShell normal:

```powershell
cd "c:\Users\NYAMMA\NYA BLO\apps\web"
npm install
```

---

### ✅ **Solution 3**: CMD Direct (Alternative)

**Ouvrir Invite de Commandes** (cmd.exe, pas PowerShell):

```cmd
cd /d "c:\Users\NYAMMA\NYA BLO\apps\web"
npm install
```

---

### ✅ **Solution 4**: VSCode Terminal

Si vous utilisez Visual Studio Code:

1. Ouvrir VSCode
2. Ouvrir le dossier `NYA BLO`
3. Menu **Terminal > New Terminal**
4. Taper:

```bash
cd apps/web
npm install
```

---

## 🎯 Vérification après installation

Une fois l'installation réussie, vérifier:

```cmd
cd apps\web

# Vérifier que node_modules existe
dir node_modules\three

# Doit afficher le contenu du dossier three
```

Si vous voyez des fichiers, Three.js est installé ✅

---

## 🚀 Ensuite

Après installation réussie:

```cmd
cd apps\web
npm run dev
```

Ou double-clic sur `START.bat`

---

## 📝 Pourquoi ce problème ?

Windows PowerShell a une politique de sécurité qui bloque l'exécution de scripts par défaut. npm.exe appelle npm.ps1 (script PowerShell), d'où l'erreur.

**Solutions**:
- Débloquer PowerShell (Solution 2) → Permanent
- Utiliser cmd au lieu de PowerShell → Temporaire  
- Utiliser script .bat spécial (Solution 1) → Plus facile

---

## 🆘 Si rien ne fonctionne

1. **Vérifier Node.js installé**:
   ```cmd
   node --version
   ```
   Doit afficher: `v18.x.x` ou plus récent

2. **Réinstaller Node.js**:
   - Télécharger depuis: https://nodejs.org/
   - Version LTS recommandée
   - Cocher "Automatically install necessary tools"

3. **Vider cache npm**:
   ```cmd
   npm cache clean --force
   ```

4. **Essayer avec flag**:
   ```cmd
   npm install --legacy-peer-deps
   ```

---

## ✅ Checklist

- [ ] Choisir une solution (1, 2, 3 ou 4)
- [ ] Exécuter l'installation
- [ ] Vérifier `node_modules/three` existe
- [ ] Lancer `npm run dev`
- [ ] Ouvrir http://localhost:3000
- [ ] Erreur disparue ✨

---

**Une fois installé, le build devrait fonctionner !** 🚀
