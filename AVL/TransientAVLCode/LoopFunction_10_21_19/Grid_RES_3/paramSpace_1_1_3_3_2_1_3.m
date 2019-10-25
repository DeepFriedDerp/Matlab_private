function [aeroForces] = paramSpace_1_1_3_3_2_1_3(sailStates,airStates)

	CL = (4.166577)*sailStates.alpha + (-0.284344)*sailStates.beta + (-2.784272)*sailStates.p + (39.149704)*sailStates.q + (-1.611847)*sailStates.r + (0.011248)*sailStates.de;
	CD = -0.187420;
	CY = (-0.033565)*sailStates.alpha + (-0.025225)*sailStates.beta + (-0.509516)*sailStates.p + (0.173376)*sailStates.q + (-0.089825)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.437554)*sailStates.alpha + (0.150097)*sailStates.beta + (-1.430989)*sailStates.p + (12.876014)*sailStates.q + (-1.262453)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-13.126450)*sailStates.alpha + (0.987974)*sailStates.beta + (8.710749)*sailStates.p + (-141.665955)*sailStates.q + (5.358522)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.264897)*sailStates.alpha + (0.043072)*sailStates.beta + (0.946508)*sailStates.p + (-3.646546)*sailStates.q + (-0.011450)*sailStates.r + (-0.000153)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end