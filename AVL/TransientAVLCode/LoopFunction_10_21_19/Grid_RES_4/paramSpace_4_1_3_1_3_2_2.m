function [aeroForces] = paramSpace_4_1_3_1_3_2_2(sailStates,airStates)

	CL = (3.748356)*sailStates.alpha + (0.155236)*sailStates.beta + (-2.510028)*sailStates.p + (34.763561)*sailStates.q + (0.557055)*sailStates.r + (0.010440)*sailStates.de;
	CD = 0.062890;
	CY = (0.200657)*sailStates.alpha + (-0.019316)*sailStates.beta + (-0.037308)*sailStates.p + (1.664521)*sailStates.q + (0.007481)*sailStates.r + (0.000351)*sailStates.de;

	Cl = (1.209896)*sailStates.alpha + (-0.009319)*sailStates.beta + (-1.231815)*sailStates.p + (10.339729)*sailStates.q + (0.343503)*sailStates.r + (0.000566)*sailStates.de;
	Cm = (-13.629868)*sailStates.alpha + (-0.605892)*sailStates.beta + (8.674396)*sailStates.p + (-136.195908)*sailStates.q + (-1.937450)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (-0.407035)*sailStates.alpha + (-0.001778)*sailStates.beta + (0.250445)*sailStates.p + (-3.224207)*sailStates.q + (-0.069522)*sailStates.r + (-0.000489)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end