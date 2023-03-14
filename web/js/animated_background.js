
const settings = {
  pointCount: 7,
  startSpeed: 0.7,
  availableColors: ["rgb(61 118 241 / 40%)", "rgb(61 118 241 / 50%)", "rgb(61 118 241 / 70%)"]
};

let context;
let objects;
let mousePos = {};

const canvas = document.createElement("canvas");
const init = () => {
  canvas.id = 'animated_background'
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
  canvas.style.zIndex = 1;
  objects = [];

  document.body.appendChild(canvas);

  context = canvas.getContext("2d");

  for (let i = 0; i <= settings.pointCount; i++) {
    let plusOrMinusX = Math.random() < 0.5 ? -1 : 1;
    let plusOrMinusY = Math.random() < 0.5 ? -1 : 1;

    const x = Math.random() * canvas.width;
    const y = Math.random() * canvas.height;
    const z = Math.random() * - 150;

    const v = {
      x: plusOrMinusX * Math.random() * settings.startSpeed,
      y: plusOrMinusY * Math.random() * settings.startSpeed,
      z: Math.random() * settings.startSpeed * 4,
    };

    const colorIndex = Math.floor(
      Math.random() * settings.availableColors.length
    );

    objects.push(
      new Point(canvas, settings.availableColors[colorIndex], x, y, z, v)
    );
  }

  bindMouseMove();

  setTimeout(()=> {
    document.body.addEventListener('click', clickHandler);
    document.body.style.cursor='pointer';
  }
  ,2000);

  function clickHandler(e) {
    $('#splash-overlay').removeClass("hide");
    $('#splash-overlay').addClass("remove-pointer-events");
    $('#welcome').removeClass("hide");
    $('#welcome').addClass("remove-pointer-events");
    $('.welcome-wrapper').addClass("hide");
    document.getElementById("animated_background").remove();
    document.body.classList.add("remove-pointer-events");
    document.body.removeEventListener('click', clickHandler);

    setTimeout(()=> {
      document.body.classList.remove("remove-pointer-events");
    }
    ,4000);
    return;
  }
}




class Point {
  constructor(canvas, color, x, y, z, v) {
    this.canvas = canvas;
    this.color = color;
    this.x = x;
    this.y = y;
    this.z = z;
    this.v = v;
    this.radius = this.calulateRadius();
  }

  calulateRadius() {
    return Math.abs(this.z / 14);
  }

  calculatePosition() {
    const diameter = 2 * this.radius;

    if (
      this.x > this.canvas.width ||
      this.y > this.canvas.height ||
      this.x + diameter < 0 ||
      this.y + diameter < 0
    ) {
      this.x = this.canvas.width / 2;
      this.y = this.canvas.height / 2;
      this.z = -40;
    }

    this.radius = this.calulateRadius();

    this.x += this.v.x;
    this.y += this.v.y;
    this.z += this.v.z;
  }

  adjustTowardsMouse(distToMouse, mouseX, mouseY) {
    if (mouseX > this.x) {
      this.v.x += 10 / distToMouse;
    }
    if (mouseY > this.Y) {
      this.v.y += 10 / distToMouse;
    }

    if (mouseX <= this.x) {
      this.v.x -= 10 / distToMouse;
    }
    if (mouseY <= this.Y) {
      this.v.y -= 10 / distToMouse;
    }
  }

  draw(context) {
    context.beginPath();
    context.strokeStyle = this.color;
    context.fillStyle = this.color;
    context.arc(this.x, this.y, this.radius, 0, 2 * Math.PI);
    context.fill();
  }
}



const draw = () => {
  context.clearRect(0, 0, canvas.width, canvas.height);

  objects.forEach(object => {
    object.calculatePosition();

    if (mousePos) {
      const xDiff = object.x - mousePos.x;
      const yDiff = object.y - mousePos.y;

      const pointDist = Math.sqrt(Math.pow(xDiff, 2) + Math.pow(yDiff, 2));

      if (pointDist < (150 + object.radius)) {
        object.adjustTowardsMouse(pointDist, mousePos.x, mousePos.y);
      }
    }

    object.draw(context);
  });

  requestAnimationFrame(draw);
};

const bindMouseMove = () => {
  listener = document.addEventListener('mousemove', e => {
    mousePos.x = e.clientX;
    mousePos.y = e.clientY;
  });
}
init();

window.addEventListener('resize', () => {
  if($('.welcome-wrapper').hasClass("hide"))
    return;
  init();
});

requestAnimationFrame(() => {
  draw();
});