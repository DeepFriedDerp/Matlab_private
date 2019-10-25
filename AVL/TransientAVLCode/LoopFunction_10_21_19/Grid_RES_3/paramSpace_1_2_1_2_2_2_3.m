function [aeroForces] = paramSpace_1_2_1_2_2_2_3(sailStates,airStates)

	CL = (3.790985)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.892624)*sailStates.p + (38.593082)*sailStates.q + (-1.031822)*sailStates.r + (0.010841)*sailStates.de;
	CD = 0.086590;
	CY = (-0.010470)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.260669)*sailStates.p + (0.267956)*sailStates.q + (-0.045988)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.333532)*sailStates.alpha + (0.119648)*sailStates.beta + (-1.494704)*sailStates.p + (12.950255)*sailStates.q + (-0.750218)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-13.441354)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.576451)*sailStates.p + (-146.430145)*sailStates.q + (3.498875)*sailStates.r + (-0.069510)*sailStates.de;
	Cn = (0.263790)*sailStates.alpha + (0.021097)*sailStates.beta + (0.335588)*sailStates.p + (-0.694507)*sailStates.q + (-0.026818)*sailStates.r + (-0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end