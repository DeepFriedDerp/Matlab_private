function [aeroForces] = paramSpace_2_3_1_2_2_2_3(sailStates,airStates)

	CL = (3.953104)*sailStates.alpha + (0.036591)*sailStates.beta + (-2.968439)*sailStates.p + (38.252682)*sailStates.q + (-0.400342)*sailStates.r + (0.011196)*sailStates.de;
	CD = 0.045150;
	CY = (-0.006491)*sailStates.alpha + (-0.024930)*sailStates.beta + (-0.114548)*sailStates.p + (0.100923)*sailStates.q + (-0.007519)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.355097)*sailStates.alpha + (0.062512)*sailStates.beta + (-1.520072)*sailStates.p + (12.634659)*sailStates.q + (-0.307185)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-14.307775)*sailStates.alpha + (-0.162033)*sailStates.beta + (10.093942)*sailStates.p + (-148.239990)*sailStates.q + (1.389004)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.106300)*sailStates.alpha + (0.003647)*sailStates.beta + (0.148221)*sailStates.p + (-0.289593)*sailStates.q + (-0.004153)*sailStates.r + (-0.000022)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end