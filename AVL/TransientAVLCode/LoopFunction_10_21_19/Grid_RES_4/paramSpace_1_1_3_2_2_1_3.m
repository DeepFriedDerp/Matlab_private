function [aeroForces] = paramSpace_1_1_3_2_2_1_3(sailStates,airStates)

	CL = (4.395018)*sailStates.alpha + (-0.452524)*sailStates.beta + (-2.926330)*sailStates.p + (41.894245)*sailStates.q + (-2.152977)*sailStates.r + (0.011426)*sailStates.de;
	CD = -0.492830;
	CY = (-0.084649)*sailStates.alpha + (-0.025713)*sailStates.beta + (-0.729294)*sailStates.p + (0.301044)*sailStates.q + (-0.145055)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.548610)*sailStates.alpha + (0.203797)*sailStates.beta + (-1.544069)*sailStates.p + (14.438139)*sailStates.q + (-1.745833)*sailStates.r + (0.000968)*sailStates.de;
	Cm = (-12.057662)*sailStates.alpha + (1.648195)*sailStates.beta + (8.696954)*sailStates.p + (-144.677322)*sailStates.q + (7.142952)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.524379)*sailStates.alpha + (0.070085)*sailStates.beta + (1.388793)*sailStates.p + (-5.412332)*sailStates.q + (-0.009963)*sailStates.r + (-0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end