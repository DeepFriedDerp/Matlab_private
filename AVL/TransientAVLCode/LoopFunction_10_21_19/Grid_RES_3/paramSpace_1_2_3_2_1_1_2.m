function [aeroForces] = paramSpace_1_2_3_2_1_1_2(sailStates,airStates)

	CL = (4.336809)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.592635)*sailStates.p + (38.279404)*sailStates.q + (-1.693147)*sailStates.r + (0.011498)*sailStates.de;
	CD = -0.359890;
	CY = (-0.101495)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.528274)*sailStates.p + (-0.759370)*sailStates.q + (-0.093221)*sailStates.r + (-0.000162)*sailStates.de;

	Cl = (1.202689)*sailStates.alpha + (0.294434)*sailStates.beta + (-1.209396)*sailStates.p + (10.696774)*sailStates.q + (-1.360260)*sailStates.r + (0.000381)*sailStates.de;
	Cm = (-12.739154)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.964247)*sailStates.p + (-136.489655)*sailStates.q + (5.638411)*sailStates.r + (-0.068470)*sailStates.de;
	Cn = (0.080971)*sailStates.alpha + (0.051917)*sailStates.beta + (1.058020)*sailStates.p + (-3.672734)*sailStates.q + (-0.015776)*sailStates.r + (0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end