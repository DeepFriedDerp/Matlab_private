function [aeroForces] = paramSpace_1_3_2_3_1_1_3(sailStates,airStates)

	CL = (4.008633)*sailStates.alpha + (0.293980)*sailStates.beta + (-2.796275)*sailStates.p + (39.135468)*sailStates.q + (-1.497443)*sailStates.r + (0.011146)*sailStates.de;
	CD = -0.133410;
	CY = (-0.091652)*sailStates.alpha + (-0.025633)*sailStates.beta + (-0.450492)*sailStates.p + (-0.318252)*sailStates.q + (-0.079434)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.219623)*sailStates.alpha + (0.323706)*sailStates.beta + (-1.353962)*sailStates.p + (11.794968)*sailStates.q + (-1.175526)*sailStates.r + (0.000580)*sailStates.de;
	Cm = (-12.761106)*sailStates.alpha + (-1.094534)*sailStates.beta + (8.848490)*sailStates.p + (-142.287766)*sailStates.q + (5.015499)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.248735)*sailStates.alpha + (0.043249)*sailStates.beta + (0.826091)*sailStates.p + (-2.733392)*sailStates.q + (-0.019519)*sailStates.r + (0.000014)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end