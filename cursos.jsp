<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="conexion.jsp" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plataforma de IA Generativa</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            /* Fondo con tu imagen local y capa oscura superpuesta para legibilidad */
            background: linear-gradient(rgba(15, 23, 42, 0.85), rgba(15, 23, 42, 0.90)), 
                        url('img/tecfondo.avif') no-repeat center center fixed;
            background-size: cover;
            color: #f8f9fa;
            min-height: 100vh;
        }
        .hero-section {
            background: rgba(30, 41, 59, 0.75);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 1rem;
        }
        .card {
            background: rgba(30, 41, 59, 0.85) !important;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1) !important;
            color: #f8f9fa;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.5)!important;
            border-color: rgba(13, 110, 253, 0.5) !important;
        }
        .custom-box {
            background: rgba(30, 41, 59, 0.8) !important;
            border: 1px solid rgba(255, 255, 255, 0.1) !important;
            color: #f8f9fa !important;
        }
        .text-muted {
            color: #adb5bd !important;
        }
    </style>
</head>
<body>

    <!-- Navbar superior -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark bg-opacity-75 shadow-sm border-bottom border-secondary">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#"><i class="fa-solid fa-brain text-info me-2"></i> IA Generativa Hub</a>
            <span class="navbar-text text-light small">Alumno: Maximiliano Jop (Grupo 7001)</span>
        </div>
    </nav>

    <div class="container my-5">
        <!-- Header Principal -->
        <header class="text-center mb-5 p-5 hero-section shadow-lg">
            <h1 class="display-5 fw-bold text-white mb-3">Plataforma de Enseñanza de IA Generativa</h1>
            <p class="lead text-light opacity-75">Espacio académico para difundir cursos, tips, consejos y recursos de Inteligencia Artificial.</p>
        </header>

        <!-- Sección de Tips Rápidos -->
        <section class="mb-5">
            <h2 class="h4 mb-3 text-white fw-bold"><i class="fa-solid fa-lightbulb text-warning me-2"></i> Tips Rápidos de Prompt Engineering</h2>
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="p-4 rounded-4 shadow-sm h-100 custom-box border-start border-primary border-4">
                        <h6 class="fw-bold text-info">1. Sé específico</h6>
                        <p class="small text-muted mb-0">Define claramente el rol, el contexto y el formato de salida que esperas de la IA.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-4 rounded-4 shadow-sm h-100 custom-box border-start border-success border-4">
                        <h6 class="fw-bold text-success">2. Usa ejemplos (Few-Shot)</h6>
                        <p class="small text-muted mb-0">Proporciona ejemplos previos del resultado que buscas para guiar con mayor precisión al modelo.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-4 rounded-4 shadow-sm h-100 custom-box border-start border-danger border-4">
                        <h6 class="fw-bold text-danger">3. Divide tareas complejas</h6>
                        <p class="small text-muted mb-0">Usa cadenas de pensamiento (Chain of Thought) para pedirle a la IA que resuelva paso a paso.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Catálogo de Cursos Dinámico desde Base de Datos -->
        <section>
            <h2 class="h4 mb-4 text-white fw-bold"><i class="fa-solid fa-graduation-cap text-info me-2"></i> Catálogo de Cursos (RF-001)</h2>
            <div class="row row-cols-1 row-cols-md-2 g-4">
                <%
                    try {
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM curso");
                        while(rs.next()) {
                %>
                <div class="col">
                    <div class="card h-100 rounded-4 shadow-sm">
                        <div class="card-body p-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="badge bg-info text-dark px-3 py-2 rounded-pill fw-bold">Curso ID: <%= rs.getInt("id_curso") %></span>
                                <span class="text-muted small"><i class="fa-regular fa-calendar me-1"></i> <%= rs.getDate("fecha_inicio") %></span>
                            </div>
                            <h5 class="card-title fw-bold text-white mb-2"><%= rs.getString("nombre") %></h5>
                            <p class="card-text text-muted"><%= rs.getString("descripcion") %></p>
                            <div class="alert custom-box border small mb-0 py-2">
                                <strong class="text-warning">Requisitos:</strong> <span class="text-light"><%= rs.getString("requisitos") %></span>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                        rs.close();
                        stmt.close();
                        if(conn != null) conn.close();
                    } catch(Exception e) {
                        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                    }
                %>
            </div>
        </section>
    </div>

    <!-- Footer -->
    <footer class="text-center py-4 text-muted small border-top border-secondary bg-dark bg-opacity-75 mt-5">
        <p class="mb-0">Universidad de Londres - Ingeniería de Software | Práctica 2do Parcial</p>
    </footer>

</body>
</html>