function [aeroForces] = paramSpace_2_4_3_1_3_3_3(sailStates,airStates)

	CL = (5.091753)*sailStates.alpha + (-0.382510)*sailStates.beta + (-3.356962)*sailStates.p + (39.296642)*sailStates.q + (1.337584)*sailStates.r + (0.010803)*sailStates.de;
	CD = -1.703120;
	CY = (0.474974)*sailStates.alpha + (-0.022945)*sailStates.beta + (0.672806)*sailStates.p + (1.915493)*sailStates.q + (0.044165)*sailStates.r + (0.000416)*sailStates.de;

	Cl = (1.233615)*sailStates.alpha + (-0.495577)*sailStates.beta + (-1.843828)*sailStates.p + (15.141380)*sailStates.q + (1.411346)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-13.158610)*sailStates.alpha + (1.587904)*sailStates.beta + (11.944573)*sailStates.p + (-159.650192)*sailStates.q + (-4.573909)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (-0.915939)*sailStates.alpha + (-0.025248)*sailStates.beta + (-1.676087)*sailStates.p + (6.585544)*sailStates.q + (-0.009596)*sailStates.r + (-0.000390)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end