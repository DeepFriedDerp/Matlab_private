function [aeroForces] = paramSpace_1_3_4_2_3_3_1(sailStates,airStates)

	CL = (4.068315)*sailStates.alpha + (-0.018955)*sailStates.beta + (-1.994079)*sailStates.p + (28.429329)*sailStates.q + (0.010373)*sailStates.r + (0.009870)*sailStates.de;
	CD = -0.269810;
	CY = (0.020091)*sailStates.alpha + (-0.024539)*sailStates.beta + (0.196180)*sailStates.p + (0.455226)*sailStates.q + (0.039072)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (0.909860)*sailStates.alpha + (-0.117996)*sailStates.beta + (-0.791450)*sailStates.p + (5.730488)*sailStates.q + (0.277705)*sailStates.r + (-0.000269)*sailStates.de;
	Cm = (-15.014528)*sailStates.alpha + (0.115951)*sailStates.beta + (7.343430)*sailStates.p + (-122.911674)*sailStates.q + (-0.007991)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.324205)*sailStates.alpha + (-0.021809)*sailStates.beta + (-0.570199)*sailStates.p + (2.436141)*sailStates.q + (-0.027273)*sailStates.r + (-0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end