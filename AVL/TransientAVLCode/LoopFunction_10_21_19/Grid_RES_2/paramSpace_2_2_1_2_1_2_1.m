function [aeroForces] = paramSpace_2_2_1_2_1_2_1(sailStates,airStates)

	CL = (4.258834)*sailStates.alpha + (-0.166507)*sailStates.beta + (-2.335714)*sailStates.p + (34.538494)*sailStates.q + (1.242436)*sailStates.r + (0.011038)*sailStates.de;
	CD = -0.162140;
	CY = (-0.078052)*sailStates.alpha + (-0.024521)*sailStates.beta + (0.434997)*sailStates.p + (-0.299435)*sailStates.q + (-0.057247)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.204680)*sailStates.alpha + (-0.257039)*sailStates.beta + (-0.986633)*sailStates.p + (8.128929)*sailStates.q + (0.969961)*sailStates.r + (-0.000043)*sailStates.de;
	Cm = (-13.900866)*sailStates.alpha + (0.585219)*sailStates.beta + (7.490161)*sailStates.p + (-129.699127)*sailStates.q + (-4.156727)*sailStates.r + (-0.068159)*sailStates.de;
	Cn = (0.263690)*sailStates.alpha + (0.025929)*sailStates.beta + (-0.877681)*sailStates.p + (3.961222)*sailStates.q + (0.004809)*sailStates.r + (0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end