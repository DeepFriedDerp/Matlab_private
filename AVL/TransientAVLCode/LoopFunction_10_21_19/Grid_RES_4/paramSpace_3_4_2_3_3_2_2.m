function [aeroForces] = paramSpace_3_4_2_3_3_2_2(sailStates,airStates)

	CL = (3.996954)*sailStates.alpha + (-0.040351)*sailStates.beta + (-2.552262)*sailStates.p + (34.667145)*sailStates.q + (0.196521)*sailStates.r + (0.010889)*sailStates.de;
	CD = 0.027890;
	CY = (0.061574)*sailStates.alpha + (-0.025265)*sailStates.beta + (-0.012931)*sailStates.p + (0.498142)*sailStates.q + (0.000830)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.158674)*sailStates.alpha + (-0.025534)*sailStates.beta + (-1.153176)*sailStates.p + (9.098761)*sailStates.q + (0.105589)*sailStates.r + (0.000220)*sailStates.de;
	Cm = (-14.526961)*sailStates.alpha + (0.121077)*sailStates.beta + (8.748819)*sailStates.p + (-136.384674)*sailStates.q + (-0.662241)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (-0.116132)*sailStates.alpha + (0.001834)*sailStates.beta + (0.072144)*sailStates.p + (-0.854210)*sailStates.q + (-0.006701)*sailStates.r + (-0.000141)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end