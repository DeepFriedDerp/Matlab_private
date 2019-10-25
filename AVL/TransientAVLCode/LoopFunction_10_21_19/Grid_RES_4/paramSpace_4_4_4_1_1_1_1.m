function [aeroForces] = paramSpace_4_4_4_1_1_1_1(sailStates,airStates)

	CL = (4.545315)*sailStates.alpha + (0.277624)*sailStates.beta + (-1.389374)*sailStates.p + (20.162153)*sailStates.q + (-1.179940)*sailStates.r + (0.008426)*sailStates.de;
	CD = -1.533640;
	CY = (0.132664)*sailStates.alpha + (-0.021284)*sailStates.beta + (-0.631616)*sailStates.p + (-1.002336)*sailStates.q + (0.125529)*sailStates.r + (-0.000207)*sailStates.de;

	Cl = (0.289479)*sailStates.alpha + (0.443532)*sailStates.beta + (-0.322775)*sailStates.p + (0.496309)*sailStates.q + (-1.322987)*sailStates.r + (-0.001005)*sailStates.de;
	Cm = (-14.351317)*sailStates.alpha + (-1.032155)*sailStates.beta + (6.248029)*sailStates.p + (-107.565659)*sailStates.q + (3.819224)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-1.366247)*sailStates.alpha + (-0.066488)*sailStates.beta + (1.523221)*sailStates.p + (-6.103817)*sailStates.q + (-0.027053)*sailStates.r + (0.000160)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end