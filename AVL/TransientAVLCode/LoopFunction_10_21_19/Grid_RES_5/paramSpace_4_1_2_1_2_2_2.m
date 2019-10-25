function [aeroForces] = paramSpace_4_1_2_1_2_2_2(sailStates,airStates)

	CL = (4.249207)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.940734)*sailStates.p + (36.169930)*sailStates.q + (0.184056)*sailStates.r + (0.010440)*sailStates.de;
	CD = -0.447590;
	CY = (0.199552)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.234427)*sailStates.p + (1.241892)*sailStates.q + (0.032903)*sailStates.r + (0.000268)*sailStates.de;

	Cl = (1.356962)*sailStates.alpha + (-0.167024)*sailStates.beta + (-1.564611)*sailStates.p + (12.901163)*sailStates.q + (0.382334)*sailStates.r + (0.000962)*sailStates.de;
	Cm = (-14.637568)*sailStates.alpha + (0.000000)*sailStates.beta + (10.520239)*sailStates.p + (-149.211060)*sailStates.q + (-0.594680)*sailStates.r + (-0.070499)*sailStates.de;
	Cn = (-0.097319)*sailStates.alpha + (-0.023474)*sailStates.beta + (-0.771973)*sailStates.p + (3.372612)*sailStates.q + (-0.023801)*sailStates.r + (-0.000278)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end