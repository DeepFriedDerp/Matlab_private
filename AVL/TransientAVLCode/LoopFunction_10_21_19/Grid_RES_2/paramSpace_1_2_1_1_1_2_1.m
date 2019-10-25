function [aeroForces] = paramSpace_1_2_1_1_1_2_1(sailStates,airStates)

	CL = (4.751437)*sailStates.alpha + (-0.129740)*sailStates.beta + (-1.976139)*sailStates.p + (27.696329)*sailStates.q + (1.003458)*sailStates.r + (0.009929)*sailStates.de;
	CD = -0.820450;
	CY = (-0.276145)*sailStates.alpha + (-0.026820)*sailStates.beta + (0.634487)*sailStates.p + (-1.226115)*sailStates.q + (0.083619)*sailStates.r + (-0.000260)*sailStates.de;

	Cl = (1.262984)*sailStates.alpha + (-0.314508)*sailStates.beta + (-0.734466)*sailStates.p + (4.687577)*sailStates.q + (1.042933)*sailStates.r + (-0.000361)*sailStates.de;
	Cm = (-15.739268)*sailStates.alpha + (0.474528)*sailStates.beta + (7.636128)*sailStates.p + (-122.915771)*sailStates.q + (-3.310298)*sailStates.r + (-0.067524)*sailStates.de;
	Cn = (1.043934)*sailStates.alpha + (-0.029713)*sailStates.beta + (-1.481790)*sailStates.p + (7.872240)*sailStates.q + (-0.045254)*sailStates.r + (0.000471)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end