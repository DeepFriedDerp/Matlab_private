function [aeroForces] = paramSpace_4_2_2_3_2_2_3(sailStates,airStates)

	CL = (3.855948)*sailStates.alpha + (0.069926)*sailStates.beta + (-2.731223)*sailStates.p + (37.394562)*sailStates.q + (1.082816)*sailStates.r + (0.010806)*sailStates.de;
	CD = 0.068090;
	CY = (0.002518)*sailStates.alpha + (-0.025177)*sailStates.beta + (0.245371)*sailStates.p + (-0.194782)*sailStates.q + (-0.048800)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.312831)*sailStates.alpha + (-0.090314)*sailStates.beta + (-1.384816)*sailStates.p + (12.085887)*sailStates.q + (0.751186)*sailStates.r + (0.000709)*sailStates.de;
	Cm = (-13.667024)*sailStates.alpha + (-0.240871)*sailStates.beta + (8.986158)*sailStates.p + (-141.871536)*sailStates.q + (-3.623706)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.226070)*sailStates.alpha + (0.021645)*sailStates.beta + (-0.318028)*sailStates.p + (0.686841)*sailStates.q + (-0.031415)*sailStates.r + (0.000092)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end