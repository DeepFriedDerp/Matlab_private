function [aeroForces] = paramSpace_4_2_2_2_1_3_1(sailStates,airStates)

	CL = (4.779166)*sailStates.alpha + (0.146459)*sailStates.beta + (-2.147905)*sailStates.p + (35.682220)*sailStates.q + (2.042892)*sailStates.r + (0.011201)*sailStates.de;
	CD = -0.628790;
	CY = (-0.193952)*sailStates.alpha + (-0.025445)*sailStates.beta + (0.755537)*sailStates.p + (-0.455226)*sailStates.q + (-0.150269)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.439887)*sailStates.alpha + (-0.316283)*sailStates.beta + (-0.871515)*sailStates.p + (8.031872)*sailStates.q + (1.648703)*sailStates.r + (-0.000184)*sailStates.de;
	Cm = (-12.390181)*sailStates.alpha + (-0.534406)*sailStates.beta + (5.997048)*sailStates.p + (-122.911674)*sailStates.q + (-6.760727)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (0.669488)*sailStates.alpha + (0.073203)*sailStates.beta + (-1.577889)*sailStates.p + (7.059064)*sailStates.q + (0.020353)*sailStates.r + (0.000247)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end