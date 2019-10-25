function [aeroForces] = paramSpace_3_4_2_2_3_3_1(sailStates,airStates)

	CL = (4.281757)*sailStates.alpha + (-0.258607)*sailStates.beta + (-2.179104)*sailStates.p + (32.601242)*sailStates.q + (1.082301)*sailStates.r + (0.010944)*sailStates.de;
	CD = -0.355870;
	CY = (0.042712)*sailStates.alpha + (-0.025623)*sailStates.beta + (0.403790)*sailStates.p + (0.870357)*sailStates.q + (-0.026496)*sailStates.r + (0.000185)*sailStates.de;

	Cl = (0.914820)*sailStates.alpha + (-0.303541)*sailStates.beta + (-0.834641)*sailStates.p + (6.363999)*sailStates.q + (0.948946)*sailStates.r + (-0.000295)*sailStates.de;
	Cm = (-13.641210)*sailStates.alpha + (0.986654)*sailStates.beta + (7.212959)*sailStates.p + (-125.466835)*sailStates.q + (-3.671431)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (0.346129)*sailStates.alpha + (0.015108)*sailStates.beta + (-0.896648)*sailStates.p + (3.374357)*sailStates.q + (0.000186)*sailStates.r + (-0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end