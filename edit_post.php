<?php
session_start();
include 'db.php';

$id = $_GET['id'] ?? 0;
$user_id = $_SESSION['user_id'] ?? 0;

// Get post data to edit
$stmt = $conn->prepare("SELECT * FROM observations WHERE id = ? AND user_id = ?");
$stmt->bind_param("ii", $id, $user_id);
$stmt->execute();
$result = $stmt->get_result();
$post = $result->fetch_assoc();

if (!$post) {
    echo "Post not found or you are not authorized.";
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $location = $_POST['location'];
    $activity = $_POST['activity'];
    $duration = $_POST['duration'];
    $comments = $_POST['comments'];

    $stmt = $conn->prepare("UPDATE observations SET location=?, activity=?, duration=?, comments=? WHERE id=? AND user_id=?");
    $stmt->bind_param("ssiiii", $location, $activity, $duration, $comments, $id, $user_id);

    if ($stmt->execute()) {
        echo "<script>alert('Post updated successfully'); window.location.href='view-post.php';</script>";
    } else {
        echo "Error updating record: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Observation</title>
</head>
<body>
    <h2>Edit Observation</h2>
    <form method="POST">
        Location: <input type="text" name="location" value="<?= htmlspecialchars($post['location']) ?>"><br><br>
        Activity: <input type="text" name="activity" value="<?= htmlspecialchars($post['activity']) ?>"><br><br>
        Duration (minutes): <input type="number" name="duration" value="<?= htmlspecialchars($post['duration']) ?>"><br><br>
        Comments: <br><textarea name="comments" rows="5" cols="50"><?= htmlspecialchars($post['comments']) ?></textarea><br><br>
        <button type="submit">Update Post</button>
    </form>
</body>
</html>
