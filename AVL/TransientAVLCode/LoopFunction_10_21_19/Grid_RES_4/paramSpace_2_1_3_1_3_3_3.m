function [aeroForces] = paramSpace_2_1_3_1_3_3_3(sailStates,airStates)

	CL = (5.091752)*sailStates.alpha + (0.382510)*sailStates.beta + (-3.356963)*sailStates.p + (39.296646)*sailStates.q + (1.337584)*sailStates.r + (0.010803)*sailStates.de;
	CD = -1.703120;
	CY = (0.474974)*sailStates.alpha + (-0.026627)*sailStates.beta + (0.672806)*sailStates.p + (1.915493)*sailStates.q + (0.044165)*sailStates.r + (0.000416)*sailStates.de;

	Cl = (1.355615)*sailStates.alpha + (-0.326156)*sailStates.beta + (-1.941527)*sailStates.p + (16.349934)*sailStates.q + (1.404985)*sailStates.r + (0.001608)*sailStates.de;
	Cm = (-13.158610)*sailStates.alpha + (-1.587904)*sailStates.beta + (11.944574)*sailStates.p + (-159.650192)*sailStates.q + (-4.573908)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-1.016436)*sailStates.alpha + (-0.028611)*sailStates.beta + (-1.682491)*sailStates.p + (6.664757)*sailStates.q + (-0.010013)*sailStates.r + (-0.000390)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end