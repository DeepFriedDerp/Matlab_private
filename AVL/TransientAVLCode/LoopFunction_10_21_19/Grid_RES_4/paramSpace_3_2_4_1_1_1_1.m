function [aeroForces] = paramSpace_3_2_4_1_1_1_1(sailStates,airStates)

	CL = (5.043817)*sailStates.alpha + (-0.124228)*sailStates.beta + (-1.606708)*sailStates.p + (25.259987)*sailStates.q + (-1.551479)*sailStates.r + (0.010074)*sailStates.de;
	CD = -1.670290;
	CY = (0.086757)*sailStates.alpha + (-0.025657)*sailStates.beta + (-0.714392)*sailStates.p + (-1.471501)*sailStates.q + (0.046668)*sailStates.r + (-0.000312)*sailStates.de;

	Cl = (0.530361)*sailStates.alpha + (0.380861)*sailStates.beta + (-0.472565)*sailStates.p + (2.610789)*sailStates.q + (-1.547971)*sailStates.r + (-0.000798)*sailStates.de;
	Cm = (-13.594599)*sailStates.alpha + (0.475375)*sailStates.beta + (6.098379)*sailStates.p + (-112.102478)*sailStates.q + (5.251267)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-1.357357)*sailStates.alpha + (-0.027535)*sailStates.beta + (1.688310)*sailStates.p + (-6.731616)*sailStates.q + (-0.007104)*sailStates.r + (0.000291)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end