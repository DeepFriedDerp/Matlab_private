function [aeroForces] = paramSpace_1_3_3_2_3_2_3(sailStates,airStates)

	CL = (3.950285)*sailStates.alpha + (0.178399)*sailStates.beta + (-2.857625)*sailStates.p + (38.349781)*sailStates.q + (-1.196859)*sailStates.r + (0.010903)*sailStates.de;
	CD = 0.025130;
	CY = (0.074183)*sailStates.alpha + (-0.022497)*sailStates.beta + (-0.341452)*sailStates.p + (1.027328)*sailStates.q + (-0.060110)*sailStates.r + (0.000219)*sailStates.de;

	Cl = (1.359450)*sailStates.alpha + (0.199544)*sailStates.beta + (-1.432900)*sailStates.p + (12.382926)*sailStates.q + (-0.835152)*sailStates.r + (0.000688)*sailStates.de;
	Cm = (-13.856253)*sailStates.alpha + (-0.564128)*sailStates.beta + (9.313622)*sailStates.p + (-144.553238)*sailStates.q + (3.973753)*sailStates.r + (-0.068478)*sailStates.de;
	Cn = (0.151620)*sailStates.alpha + (0.022714)*sailStates.beta + (0.536624)*sailStates.p + (-2.476517)*sailStates.q + (-0.008468)*sailStates.r + (-0.000358)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end