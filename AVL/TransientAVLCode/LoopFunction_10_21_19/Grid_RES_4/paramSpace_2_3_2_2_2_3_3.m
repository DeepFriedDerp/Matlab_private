function [aeroForces] = paramSpace_2_3_2_2_2_3_3(sailStates,airStates)

	CL = (4.379560)*sailStates.alpha + (-0.049306)*sailStates.beta + (-2.942390)*sailStates.p + (37.028328)*sailStates.q + (0.618150)*sailStates.r + (0.010982)*sailStates.de;
	CD = -0.398490;
	CY = (0.075327)*sailStates.alpha + (-0.024937)*sailStates.beta + (0.377378)*sailStates.p + (0.100924)*sailStates.q + (0.024731)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.456207)*sailStates.alpha + (-0.205607)*sailStates.beta + (-1.511875)*sailStates.p + (12.315058)*sailStates.q + (0.661285)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-14.802430)*sailStates.alpha + (0.192708)*sailStates.beta + (10.321714)*sailStates.p + (-148.239990)*sailStates.q + (-2.086132)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (-0.037134)*sailStates.alpha + (-0.011945)*sailStates.beta + (-0.944789)*sailStates.p + (4.586570)*sailStates.q + (-0.012097)*sailStates.r + (0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end