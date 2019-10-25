function [aeroForces] = paramSpace_3_4_3_1_3_1_1(sailStates,airStates)

	CL = (6.918158)*sailStates.alpha + (0.515845)*sailStates.beta + (-1.621413)*sailStates.p + (24.790447)*sailStates.q + (-2.445916)*sailStates.r + (0.009945)*sailStates.de;
	CD = -2.822420;
	CY = (0.688655)*sailStates.alpha + (-0.027032)*sailStates.beta + (-1.277315)*sailStates.p + (1.915489)*sailStates.q + (0.083787)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (1.942129)*sailStates.alpha + (0.720793)*sailStates.beta + (-0.419511)*sailStates.p + (1.670146)*sailStates.q + (-2.299965)*sailStates.r + (-0.000891)*sailStates.de;
	Cm = (-16.456625)*sailStates.alpha + (-1.978182)*sailStates.beta + (6.423278)*sailStates.p + (-112.650780)*sailStates.q + (8.254756)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-2.695002)*sailStates.alpha + (-0.030080)*sailStates.beta + (2.831114)*sailStates.p + (-14.297575)*sailStates.q + (-0.033107)*sailStates.r + (-0.000744)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end