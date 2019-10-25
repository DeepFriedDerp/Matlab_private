function [aeroForces] = paramSpace_2_3_3_1_2_2_2(sailStates,airStates)

	CL = (4.063941)*sailStates.alpha + (0.019664)*sailStates.beta + (-2.566783)*sailStates.p + (34.960709)*sailStates.q + (-0.329150)*sailStates.r + (0.011056)*sailStates.de;
	CD = 0.028690;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (-0.068126)*sailStates.p + (-0.000000)*sailStates.q + (-0.004465)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.230801)*sailStates.alpha + (0.041055)*sailStates.beta + (-1.191774)*sailStates.p + (9.584284)*sailStates.q + (-0.215650)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-14.725522)*sailStates.alpha + (-0.061502)*sailStates.beta + (8.758286)*sailStates.p + (-137.194580)*sailStates.q + (1.105066)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.037625)*sailStates.alpha + (0.002343)*sailStates.beta + (0.091801)*sailStates.p + (-0.239676)*sailStates.q + (-0.003030)*sailStates.r + (-0.000014)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end