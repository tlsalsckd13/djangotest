from django.shortcuts import render, get_object_or_404
from .models import Post

def index(request):
    posts = Post.objects.all()
    return render(request, 'board/index.html', {'posts-test': posts})

def post_detail(request, post_id):
    post = get_object_or_404(Post, pk=post_id)
    return render(request, 'board/post_detail.html', {'post-test': post})
