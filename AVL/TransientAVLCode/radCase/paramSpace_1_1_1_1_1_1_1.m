function [aeroForces] = paramSpace_1_1_1_1_1_1_1(sailStates,airStates)

	CL = (4.089088)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.580097)*sailStates.p + (34.962719)*sailStates.q + (0.015563)*sailStates.r + (0.011113)*sailStates.de;
	CD = 0.025010;
	CY = (-0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.003532)*sailStates.p + (0.000000)*sailStates.q + (-0.000011)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.264899)*sailStates.alpha + (-0.001766)*sailStates.beta + (-1.214909)*sailStates.p + (9.780722)*sailStates.q + (0.010669)*sailStates.r + (0.000346)*sailStates.de;
	Cm = (-14.845816)*sailStates.alpha + (0.000000)*sailStates.beta + (8.838965)*sailStates.p + (-137.619293)*sailStates.q + (-0.052800)*sailStates.r + (-0.070498)*sailStates.de;
	Cn = (-0.001944)*sailStates.alpha + (0.000005)*sailStates.beta + (-0.004735)*sailStates.p + (0.010848)*sailStates.q + (-0.000007)*sailStates.r + (0.000000)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end