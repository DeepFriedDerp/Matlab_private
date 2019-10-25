function [aeroForces] = paramSpace_4_3_2_2_1_3_1(sailStates,airStates)

	CL = (4.779166)*sailStates.alpha + (-0.146459)*sailStates.beta + (-2.147905)*sailStates.p + (35.682220)*sailStates.q + (2.042892)*sailStates.r + (0.011201)*sailStates.de;
	CD = -0.628790;
	CY = (-0.193952)*sailStates.alpha + (-0.024508)*sailStates.beta + (0.755537)*sailStates.p + (-0.455226)*sailStates.q + (-0.150269)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.391687)*sailStates.alpha + (-0.401989)*sailStates.beta + (-0.839972)*sailStates.p + (7.634908)*sailStates.q + (1.642443)*sailStates.r + (-0.000269)*sailStates.de;
	Cm = (-12.390181)*sailStates.alpha + (0.534406)*sailStates.beta + (5.997048)*sailStates.p + (-122.911674)*sailStates.q + (-6.760727)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.711695)*sailStates.alpha + (0.069670)*sailStates.beta + (-1.584163)*sailStates.p + (7.138025)*sailStates.q + (0.021598)*sailStates.r + (0.000247)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end