function [aeroForces] = paramSpace_4_3_2_2_3_1_3(sailStates,airStates)

	CL = (4.229242)*sailStates.alpha + (0.015835)*sailStates.beta + (-2.813111)*sailStates.p + (34.833351)*sailStates.q + (-0.078606)*sailStates.r + (0.010164)*sailStates.de;
	CD = -0.401400;
	CY = (-0.003898)*sailStates.alpha + (-0.025445)*sailStates.beta + (-0.326635)*sailStates.p + (0.455225)*sailStates.q + (0.064955)*sailStates.r + (0.000097)*sailStates.de;

	Cl = (1.457632)*sailStates.alpha + (0.145766)*sailStates.beta + (-1.455005)*sailStates.p + (11.779521)*sailStates.q + (-0.317509)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-15.043636)*sailStates.alpha + (-0.083573)*sailStates.beta + (10.355690)*sailStates.p + (-146.782669)*sailStates.q + (0.181475)*sailStates.r + (-0.068930)*sailStates.de;
	Cn = (-0.195749)*sailStates.alpha + (-0.025077)*sailStates.beta + (0.982771)*sailStates.p + (-5.708522)*sailStates.q + (-0.074786)*sailStates.r + (-0.000205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end