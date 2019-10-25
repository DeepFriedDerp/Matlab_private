function [aeroForces] = paramSpace_2_1_3_2_1_1_1(sailStates,airStates)

	CL = (4.281757)*sailStates.alpha + (-0.258607)*sailStates.beta + (-2.179104)*sailStates.p + (32.601242)*sailStates.q + (-1.082301)*sailStates.r + (0.010944)*sailStates.de;
	CD = -0.355870;
	CY = (-0.042712)*sailStates.alpha + (-0.023949)*sailStates.beta + (-0.403790)*sailStates.p + (-0.870357)*sailStates.q + (-0.026496)*sailStates.r + (-0.000185)*sailStates.de;

	Cl = (1.075977)*sailStates.alpha + (0.165390)*sailStates.beta + (-0.932340)*sailStates.p + (7.572558)*sailStates.q + (-0.955307)*sailStates.r + (-0.000038)*sailStates.de;
	Cm = (-13.641211)*sailStates.alpha + (0.986654)*sailStates.beta + (7.212958)*sailStates.p + (-125.466835)*sailStates.q + (3.671430)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (-0.273412)*sailStates.alpha + (0.015627)*sailStates.beta + (0.890245)*sailStates.p + (-3.295144)*sailStates.q + (-0.000231)*sailStates.r + (0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end