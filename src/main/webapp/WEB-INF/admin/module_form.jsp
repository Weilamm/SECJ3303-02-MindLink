<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Module Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #FFF3E0; padding: 40px; color: #003049; }
        .form-card { background: white; max-width: 600px; margin: 0 auto; padding: 40px; border-radius: 20px; }
        
        .form-group { margin-bottom: 20px; }
        label { display: block; font-weight: 600; margin-bottom: 8px; }
        input, textarea { width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 8px; font-family: inherit; }
        
        .btn-save { background: #48C9B0; color: white; border: none; padding: 12px 30px; border-radius: 20px; font-weight: 600; cursor: pointer; width: 100%; font-size: 16px; }
    </style>
</head>
<body>
    <div class="form-card">
        <h2 style="margin-top:0;">${module.id == null || module.id == '' ? 'Add New' : 'Edit'} Module</h2>
        
        <form action="/admin/modules/save" method="post">
            <input type="hidden" name="id" value="${module.id}">
            
            <div class="form-group">
                <label>Title</label>
                <input type="text" name="title" value="${module.title}" required>
            </div>
            
            <div class="form-group">
                <label>Description</label>
                <textarea name="description" rows="4" required>${module.description}</textarea>
            </div>
            
            <div class="form-group">
                <label>Image Filename (e.g., intro.png)</label>
                <input type="text" name="imagePath" value="${module.imagePath}" placeholder="mental-health-intro.png">
            </div>
            
            <button type="submit" class="btn-save">Save Module</button>
            <a href="/admin/modules" style="display:block; text-align:center; margin-top:15px; color:#666; text-decoration:none;">Cancel</a>
        </form>
    </div>
</body>
</html>