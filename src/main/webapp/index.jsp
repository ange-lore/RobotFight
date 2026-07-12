<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>RobotCombat - Jenkins & Tomcat</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body{
            background: linear-gradient(135deg,#0f172a,#1e293b,#334155);
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            color:white;
        }

        .container{
            width:90%;
            max-width:900px;
            background:rgba(255,255,255,0.08);
            backdrop-filter:blur(10px);
            border-radius:20px;
            padding:40px;
            text-align:center;
            box-shadow:0 10px 30px rgba(0,0,0,0.4);
        }

        h1{
            font-size:3rem;
            color:#38bdf8;
            margin-bottom:10px;
        }

        h2{
            color:#22c55e;
            margin-bottom:25px;
        }

        p{
            font-size:1.1rem;
            margin-bottom:20px;
            line-height:1.8;
        }

        .success{
            background:#16a34a;
            padding:15px;
            border-radius:12px;
            margin:25px 0;
            font-size:1.2rem;
            font-weight:bold;
        }

        .cards{
            display:grid;
            grid-template-columns:repeat(auto-fit,minmax(180px,1fr));
            gap:20px;
            margin-top:30px;
        }

        .card{
            background:white;
            color:black;
            padding:20px;
            border-radius:15px;
            transition:0.3s;
        }

        .card:hover{
            transform:translateY(-8px);
        }

        .emoji{
            font-size:2rem;
            margin-bottom:10px;
        }

        footer{
            margin-top:30px;
            color:#cbd5e1;
            font-size:0.9rem;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>🤖 RobotCombat</h1>

    <h2>CI/CD avec Jenkins & Apache Tomcat</h2>

    <p>
        Application déployée automatiquement grâce à Jenkins.
    </p>

    <div class="success">
        ✅ TP7 VALIDÉ AVEC SUCCÈS
    </div>

    <p>
        Cette application a été :
    </p>

    <div class="cards">

        <div class="card">
            <div class="emoji">📥</div>
            <h3>GitHub</h3>
            <p>Code récupéré depuis GitHub</p>
        </div>

        <div class="card">
            <div class="emoji">⚙️</div>
            <h3>Build Maven</h3>
            <p>Compilation automatique</p>
        </div>

        <div class="card">
            <div class="emoji">🧪</div>
            <h3>Tests</h3>
            <p>JUnit exécuté avec succès</p>
        </div>

        <div class="card">
            <div class="emoji">📦</div>
            <h3>WAR</h3>
            <p>Artefact généré automatiquement</p>
        </div>

        <div class="card">
            <div class="emoji">🚀</div>
            <h3>Déploiement</h3>
            <p>Déployé sur Apache Tomcat</p>
        </div>

        <div class="card">
            <div class="emoji">✅</div>
            <h3>CI/CD</h3>
            <p>Pipeline réussi</p>
        </div>

    </div>

    <footer>
        Réalisé par Ange Madjiobou • Jenkins • Maven • SonarQube • Tomcat
    </footer>

</div>

</body>
</html>
