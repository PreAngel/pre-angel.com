---
title: "About"
layout: page-sidebar
permalink: "/about.html"
image: assets/2015/12-five-years/group-photo-2k.jpg
comments: true
---

{% assign partners = site.peoples | where: 'preangel', 'partner' %}

<div class="container">
<div class="row gap-y listrecent listrecent listauthor">

  {% for partner in partners %}

    <div class="col-lg-6 mb-4">
      <div class="p-4 border rounded">
        <div class="row">
          <div class="col-md-3 mb-4 mb-md-0">
            <img alt="{{ partner.name }}" src="{{ partner.avatar }}" class="rounded-circle" height="80" width="80">
          </div>
          <div class="col-md-9">
            <a href="{{site.baseurl}}/peoples/{{ partner.slug }}">
              <h4 class="text-dark mb-0"> {{ partner.name }} </h4>
              <small class="d-inline-block mt-1 mb-3 font-weight-normal">(View Posts)</small>
              <div class="excerpt">{{ partner.bio }}</div>
            </a>
            <div class="icon-block mt-3 d-flex justify-content-between">
              <div>
                <a target="_blank" href="{{ partner.twitter }}"><i class="fab fa-twitter text-muted" aria-hidden="true"></i></a>  &nbsp;
                <a target="_blank" href="{{ partner.site }}"><i class="fa fa-globe text-muted" aria-hidden="true"></i></a> &nbsp;
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  {% endfor %}

</div>
</div>

Made with <i class="fa fa-heart text-danger"></i> by [@Huan](/peoples/huan/).
