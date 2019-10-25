function [aeroForces] = paramSpace_2_2_1_1_1_2_1(sailStates,airStates)

	CL = (5.215133)*sailStates.alpha + (-0.289271)*sailStates.beta + (-2.070784)*sailStates.p + (33.966576)*sailStates.q + (2.060157)*sailStates.r + (0.011255)*sailStates.de;
	CD = -0.993810;
	CY = (-0.279881)*sailStates.alpha + (-0.023989)*sailStates.beta + (0.851425)*sailStates.p + (-0.715004)*sailStates.q + (-0.112042)*sailStates.r + (-0.000151)*sailStates.de;

	Cl = (1.474158)*sailStates.alpha + (-0.482183)*sailStates.beta + (-0.752709)*sailStates.p + (6.368367)*sailStates.q + (1.724557)*sailStates.r + (-0.000447)*sailStates.de;
	Cm = (-13.242610)*sailStates.alpha + (1.059368)*sailStates.beta + (6.066823)*sailStates.p + (-121.082581)*sailStates.q + (-6.891488)*sailStates.r + (-0.067358)*sailStates.de;
	Cn = (1.076177)*sailStates.alpha + (0.048453)*sailStates.beta + (-1.836850)*sailStates.p + (8.760786)*sailStates.q + (0.027667)*sailStates.r + (0.000343)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end