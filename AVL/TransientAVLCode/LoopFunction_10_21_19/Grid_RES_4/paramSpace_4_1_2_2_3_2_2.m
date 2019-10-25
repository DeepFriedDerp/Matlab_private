function [aeroForces] = paramSpace_4_1_2_2_3_2_2(sailStates,airStates)

	CL = (3.780822)*sailStates.alpha + (0.167021)*sailStates.beta + (-2.483950)*sailStates.p + (34.864876)*sailStates.q + (0.781039)*sailStates.r + (0.010521)*sailStates.de;
	CD = 0.070830;
	CY = (0.093560)*sailStates.alpha + (-0.022458)*sailStates.beta + (0.092632)*sailStates.p + (0.756270)*sailStates.q + (-0.018453)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.209980)*sailStates.alpha + (-0.023579)*sailStates.beta + (-1.215492)*sailStates.p + (10.384846)*sailStates.q + (0.510969)*sailStates.r + (0.000505)*sailStates.de;
	Cm = (-13.635837)*sailStates.alpha + (-0.580630)*sailStates.beta + (8.373150)*sailStates.p + (-134.899979)*sailStates.q + (-2.639184)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.265001)*sailStates.alpha + (0.008409)*sailStates.beta + (-0.032356)*sailStates.p + (-1.168748)*sailStates.q + (-0.047104)*sailStates.r + (-0.000201)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end