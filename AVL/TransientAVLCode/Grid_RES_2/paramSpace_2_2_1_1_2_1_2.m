function [aeroForces] = paramSpace_2_2_1_1_2_1_2(sailStates,airStates)

	CL = (5.529188)*sailStates.alpha + (-3.988642)*sailStates.beta + (-3.502858)*sailStates.p + (48.132683)*sailStates.q + (2.311275)*sailStates.r + (0.010605)*sailStates.de;
	CD = -6.550890;
	CY = (1.851910)*sailStates.alpha + (-0.254782)*sailStates.beta + (0.337288)*sailStates.p + (15.979935)*sailStates.q + (-0.035351)*sailStates.r + (0.003045)*sailStates.de;

	Cl = (-5.892138)*sailStates.alpha + (-1.292995)*sailStates.beta + (-1.707792)*sailStates.p + (14.572890)*sailStates.q + (2.550809)*sailStates.r + (0.001281)*sailStates.de;
	Cm = (6.746075)*sailStates.alpha + (17.895447)*sailStates.beta + (10.843711)*sailStates.p + (-152.723190)*sailStates.q + (-8.173334)*sailStates.r + (-0.055429)*sailStates.de;
	Cn = (-1.959832)*sailStates.alpha + (0.359676)*sailStates.beta + (-0.980967)*sailStates.p + (-8.762171)*sailStates.q + (-0.199202)*sailStates.r + (-0.003968)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end