function [aeroForces] = paramSpace_3_3_2_3_2_3_3(sailStates,airStates)

	CL = (4.264371)*sailStates.alpha + (-0.072039)*sailStates.beta + (-2.844055)*sailStates.p + (37.849964)*sailStates.q + (1.015599)*sailStates.r + (0.011343)*sailStates.de;
	CD = -0.186800;
	CY = (0.033499)*sailStates.alpha + (-0.024955)*sailStates.beta + (0.386978)*sailStates.p + (-0.065299)*sailStates.q + (-0.025362)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.392640)*sailStates.alpha + (-0.212939)*sailStates.beta + (-1.409749)*sailStates.p + (11.763142)*sailStates.q + (0.853936)*sailStates.r + (0.000645)*sailStates.de;
	Cm = (-14.311471)*sailStates.alpha + (0.266162)*sailStates.beta + (9.482149)*sailStates.p + (-144.341232)*sailStates.q + (-3.429889)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (-0.089010)*sailStates.alpha + (0.012295)*sailStates.beta + (-0.791795)*sailStates.p + (3.402617)*sailStates.q + (0.001957)*sailStates.r + (0.000097)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end