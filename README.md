# Segre-Lab Metabolic Data Explorer — Frontend Setup



## Project Structure (Important Directories)

```
Segre-Lab-Metabolic-Data-Explorer/
├── app.py                  # Flask backend
├── static/                 # Production frontend (React build output)
├── frontend/               # React source code — this is where you work
│   ├── src/
│   ├── public/
│   └── package.json
└── deploy.sh               # Script to build & deploy frontend
```

---

## Prerequisites

Make sure you have the following installed:
- A terminal with access to this project directory
- Run "npm" in your terminal in Bioed to see if Node.js is configured


## Creating a Database Credentials Key
### 1. Navigate to root project directory: Segre-Lab-Metabolic-Data-Explorer/
### 2. Create key file

```bash
touch .key.txt
```

### 3. Add your BU database credentials in this format

```bash
<BU_username>
<password>
<database_name>
<port>
```
Remember that port is typically **4253** and database name has to be replaced with the name of a database that is **actively being served** on the Bioed SQL server

## Working on the Frontend (React)

### 1. Navigate to the frontend directory

```bash
cd frontend
```

### 2. Components
All the frontend code that you will need to edit will be in either src or public. Public should contain all the public-facing assets like images, html favicons, etc. 


## Make Your Changes

- Edit files inside `frontend/src/`
- `App.js` is the main entry point

---

## Build and Deploy to Flask

Once you're done editing and ready to push your changes live:

### cd to the project root, then:
```bash
./deploy.sh
```

This will:
- Build the React app using `npm run build`
- Move the build output into the Flask `static/` directory
- Flatten the static asset structure so Flask can serve it properly

Once deployed, the app will be available at:

```
https://bioed-new.bu.edu/students_25/<username>/Segre-Lab-Metabolic-Data-Explorer/app
```

---

## 🤝 Need Help?

If you get stuck:
- Check the browser **DevTools Console** for errors
- Text Sandi
