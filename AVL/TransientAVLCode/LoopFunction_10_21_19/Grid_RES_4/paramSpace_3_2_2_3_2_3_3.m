function [aeroForces] = paramSpace_3_2_2_3_2_3_3(sailStates,airStates)

	CL = (4.264370)*sailStates.alpha + (0.072040)*sailStates.beta + (-2.844056)*sailStates.p + (37.849964)*sailStates.q + (1.015599)*sailStates.r + (0.011343)*sailStates.de;
	CD = -0.186800;
	CY = (0.033499)*sailStates.alpha + (-0.024997)*sailStates.beta + (0.386978)*sailStates.p + (-0.065299)*sailStates.q + (-0.025362)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.438377)*sailStates.alpha + (-0.168267)*sailStates.beta + (-1.442398)*sailStates.p + (12.167018)*sailStates.q + (0.856061)*sailStates.r + (0.000733)*sailStates.de;
	Cm = (-14.311470)*sailStates.alpha + (-0.266163)*sailStates.beta + (9.482151)*sailStates.p + (-144.341232)*sailStates.q + (-3.429889)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (-0.108729)*sailStates.alpha + (0.012691)*sailStates.beta + (-0.789655)*sailStates.p + (3.376146)*sailStates.q + (0.001818)*sailStates.r + (0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end