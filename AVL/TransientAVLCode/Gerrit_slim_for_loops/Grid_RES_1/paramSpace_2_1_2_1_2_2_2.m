function [aeroForces] = paramSpace_2_1_2_1_2_2_2(sailStates,airStates)

	CL = (6.149934)*sailStates.alpha + (-2.037541)*sailStates.beta + (-3.753226)*sailStates.p + (51.423077)*sailStates.q + (2.243225)*sailStates.r + (0.012854)*sailStates.de;
	CD = -6.328640;
	CY = (2.055663)*sailStates.alpha + (-0.140299)*sailStates.beta + (0.276705)*sailStates.p + (16.277601)*sailStates.q + (-0.028359)*sailStates.r + (0.003451)*sailStates.de;

	Cl = (-5.543652)*sailStates.alpha + (-1.068866)*sailStates.beta + (-1.913492)*sailStates.p + (16.572014)*sailStates.q + (2.490619)*sailStates.r + (0.001701)*sailStates.de;
	Cm = (4.063076)*sailStates.alpha + (9.143547)*sailStates.beta + (11.769594)*sailStates.p + (-166.453674)*sailStates.q + (-7.941425)*sailStates.r + (-0.068472)*sailStates.de;
	Cn = (-2.315666)*sailStates.alpha + (0.233991)*sailStates.beta + (-0.830626)*sailStates.p + (-9.782367)*sailStates.q + (-0.204746)*sailStates.r + (-0.004512)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end