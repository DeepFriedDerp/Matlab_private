function [aeroForces] = paramSpace_2_1_2_3_3_2_2(sailStates,airStates)

	CL = (4.018814)*sailStates.alpha + (-0.097890)*sailStates.beta + (-2.541991)*sailStates.p + (34.738598)*sailStates.q + (-0.465438)*sailStates.r + (0.010857)*sailStates.de;
	CD = 0.023270;
	CY = (0.062142)*sailStates.alpha + (-0.025370)*sailStates.beta + (-0.162999)*sailStates.p + (0.498142)*sailStates.q + (-0.010701)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.337326)*sailStates.alpha + (0.029919)*sailStates.beta + (-1.244510)*sailStates.p + (10.325482)*sailStates.q + (-0.348360)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.459121)*sailStates.alpha + (0.380441)*sailStates.beta + (8.631155)*sailStates.p + (-135.916275)*sailStates.q + (1.581204)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (-0.028863)*sailStates.alpha + (0.004366)*sailStates.beta + (0.274168)*sailStates.p + (-1.315137)*sailStates.q + (0.000480)*sailStates.r + (-0.000158)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end