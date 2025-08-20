<?php
session_start();
include 'db.php';

$id = $_GET['id'] ?? 0;
$user_id = $_SESSION['user_id'] ?? 0;

// First check if post exists and belongs to the user
$stmt = $conn->prepare("SELECT image FROM observations WHERE id = ? AND user_id = ?");
$stmt->bind_param("ii", $id, $user_id);
$stmt->execute();
$result = $stmt->get_result();
$post = $result->fetch_assoc();

if (!$post) {
    echo "Post not found or you are not authorized.";
    exit;
}

// Delete image file if exists
if (!empty($post['image']) && file_exists("uploads/" . $post['image'])) {
    unlink("uploads/" . $post['image']);
}

// Now delete the post
$stmt = $conn->prepare("DELETE FROM observations WHERE id = ? AND user_id = ?");
$stmt->bind_param("ii", $id, $user_id);
$stmt->execute();

echo "<script>alert('Post deleted successfully'); window.location.href='view-post.php';</script>";
