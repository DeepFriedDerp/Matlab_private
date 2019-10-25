function [aeroForces] = paramSpace_4_2_4_2_2_2_1(sailStates,airStates)

	CL = (3.759589)*sailStates.alpha + (0.071778)*sailStates.beta + (-2.091833)*sailStates.p + (32.051861)*sailStates.q + (0.842241)*sailStates.r + (0.010322)*sailStates.de;
	CD = 0.085740;
	CY = (0.004230)*sailStates.alpha + (-0.024625)*sailStates.beta + (0.195391)*sailStates.p + (0.301045)*sailStates.q + (-0.038833)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.004359)*sailStates.alpha + (-0.092864)*sailStates.beta + (-0.860363)*sailStates.p + (7.045868)*sailStates.q + (0.587556)*sailStates.r + (-0.000134)*sailStates.de;
	Cm = (-13.235843)*sailStates.alpha + (-0.289480)*sailStates.beta + (6.906887)*sailStates.p + (-123.990753)*sailStates.q + (-2.863374)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (0.013042)*sailStates.alpha + (0.020865)*sailStates.beta + (-0.301265)*sailStates.p + (0.579440)*sailStates.q + (-0.023220)*sailStates.r + (-0.000079)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end