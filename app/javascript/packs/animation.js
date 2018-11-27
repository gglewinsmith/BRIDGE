var svg = {
  head: {
    container: $('svg').find('#head'),
    top: $('svg').find('#headTop'),
    bottom: $('svg').find('#headBottom'),
    phones: $('svg').find('#headphones'),
    bandaid: $('svg').find('#bandaid')
  },
  brain: {
    container: $('svg').find('#brain'),
    bg: $('svg').find('#brain-bg'),
    folds: $('svg').find('#folds-group'),
    water: $('svg').find('#water-1, #water-2'),
    waterFront: $('svg').find('#water-1'),
    waterBack: $('svg').find('#water-2')
  },
  bg: {
    circles: $('svg').find('#circles circle'),
    cover: $('svg').find('#cover'),
  },
  fact: $('svg').find('#fact')
}

svg.head.all = [
    svg.head.top,
    svg.head.bottom
  ],
  svg.brain.all = [
    svg.brain.bg,
    svg.brain.folds,
    svg.brain.waterBack,
    svg.brain.waterFront,
  ],
  svg.bg.all = [
    svg.bg.circles,
    svg.bg.cover,
  ]

tl = new TimelineMax({
  delay: 1,
  // repeat: -1,
  // yoyo: true
  // paused: true
  defaultEase: Quad.easeIn
});

tl
// Setup
  .set([svg.brain.water, svg.head.phones], {
    opacity: 0
  })
  .set(svg.brain.water, {
    yPercent: '0%'
  })
  .set(svg.head.container, {
    opacity: 1,
    y: '180'
  })
  .set(svg.head.top, {
    transformOrigin: 'right 71px',
    y: '1'
  })
  .set(svg.fact, {
    transformOrigin: 'center center',
  })

  // Start it up
  .add('start')

  // Scalp him and lose the head
  .add('headsplit', '+=0.5')
  .set([svg.brain.bg, svg.brain.folds], {
    opacity: 1
  })
  .to(svg.head.top, 0.5, {
    rotation: '150deg',
    ease: Power3.easeOut
  }, 'headsplit')
  .from(svg.brain.container, 0.3, {
    y: '180'
  }, 'headsplit+=0.3')

  //Fill 'er up
  .add('brainfill')
  .set(svg.brain.water, {
    opacity: 1
  }, 'headsplit')
  .from('#SVGID_2_', 1.5, {
    y: '-300px',
    // ease: Power0.easeNone
  }, 'brainfill+=0.5')
  .from(svg.brain.water, 1.5, {
    y: '300px',
    // ease: Power0.easeNone
  }, 'brainfill+=0.5')

  // Make the Halo appear
  .staggerFromTo(svg.bg.circles, 2, {
  display: 'none'
}, {
  display: 'block'
}, -0.2, 'brainfill-=0.2')

  // Rotate the fact in
  .add('factIn', 'brainfill')
  .fromTo(svg.fact, 4, {
    rotation: '180deg',
  }, {
    rotation: '-180deg',
    ease: SlowMo.ease.config(0.1, 0.9, false)
  }, 'factIn')

// Flip the Fact letters
// .set('#fact path', {
//     transformOrigin: 'center center',
//     perspective: 400
//   }, 'factIn')
//   .staggerTo('#fact path', 0.5, {
//     rotationY: -360
//   }, 0.1, 'factIn+=1')

  // Close the head up nice
  .add('headClose', '-=0.3')
  .to(svg.head.top, 0.2, {
    rotation: '0deg'
  }, 'headClose')
  .to(svg.head.container, 0.2, {
    y: '20'
  }, 'headClose')

// Patch him up
  .fromTo(svg.head.bandaid, 0.2, {
    y: '-50'
  }, {
    opacity: 1,
    y: '0'
  }, '+=0.3')
  .fromTo('.bottom', 0.4, {
    y: '30'
  }, {
    y: 0,
    opacity: 1,
  });


// Strobe the circles
var strobeTl = new TimelineMax({
  paused: true,
  repeat: -1,
  yoyo: true
});
strobeTl
  .staggerTo(svg.bg.circles, 0.4, {
    fill: '#FF0000'
  }, -0.1)
  .staggerTo(svg.bg.circles, 0.4, {
    clearProps: 'fill'
  }, -0.1, '-=0.3');

// Replay
$('#replay').on('click', function() {
  strobeTl.progress(0).pause();
  tl.progress(0).play();
});

// Jam
$('#jam').on('click', function() {
  strobeTl.timeScale = 4;
  TweenMax.to(svg.head.bandaid, 0.2, {
    opacity: 0,
    y: '30'
  })
  TweenMax.fromTo(svg.head.phones, 0.2, {
    y: '-50',
    opacity: 0
  }, {
    opacity: 1,
    y: '0'
  })
  strobeTl.progress(0).play();
});
