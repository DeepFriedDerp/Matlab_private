function [aeroForces] = paramSpace_1_1_2_1_2_1_1(sailStates,airStates)

	CL = (5.215133)*sailStates.alpha + (-0.289271)*sailStates.beta + (-2.070784)*sailStates.p + (33.966576)*sailStates.q + (-2.060158)*sailStates.r + (0.011255)*sailStates.de;
	CD = -0.993810;
	CY = (0.279881)*sailStates.alpha + (-0.025821)*sailStates.beta + (-0.851425)*sailStates.p + (0.715004)*sailStates.q + (-0.112042)*sailStates.r + (0.000151)*sailStates.de;

	Cl = (1.578667)*sailStates.alpha + (0.307759)*sailStates.beta + (-0.817115)*sailStates.p + (7.170169)*sailStates.q + (-1.732979)*sailStates.r + (-0.000276)*sailStates.de;
	Cm = (-13.242610)*sailStates.alpha + (1.059369)*sailStates.beta + (6.066823)*sailStates.p + (-121.082581)*sailStates.q + (6.891487)*sailStates.r + (-0.067358)*sailStates.de;
	Cn = (-0.992018)*sailStates.alpha + (0.055545)*sailStates.beta + (1.828371)*sailStates.p + (-8.655226)*sailStates.q + (0.026558)*sailStates.r + (-0.000343)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end