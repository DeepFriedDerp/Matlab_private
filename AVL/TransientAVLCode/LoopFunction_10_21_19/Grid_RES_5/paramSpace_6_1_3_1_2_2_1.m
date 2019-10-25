function [aeroForces] = paramSpace_6_1_3_1_2_2_1(sailStates,airStates)

	CL = (4.408979)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.011578)*sailStates.p + (29.285337)*sailStates.q + (0.746169)*sailStates.r + (0.010507)*sailStates.de;
	CD = -0.548020;
	CY = (0.018219)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.396325)*sailStates.p + (0.839975)*sailStates.q + (0.027743)*sailStates.r + (0.000180)*sailStates.de;

	Cl = (0.903257)*sailStates.alpha + (-0.232104)*sailStates.beta + (-0.774019)*sailStates.p + (5.515265)*sailStates.q + (0.816763)*sailStates.r + (-0.000346)*sailStates.de;
	Cm = (-14.722077)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.238885)*sailStates.p + (-122.784714)*sailStates.q + (-2.547149)*sailStates.r + (-0.068758)*sailStates.de;
	Cn = (0.497631)*sailStates.alpha + (-0.016230)*sailStates.beta + (-0.953749)*sailStates.p + (3.776978)*sailStates.q + (-0.005888)*sailStates.r + (-0.000169)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end