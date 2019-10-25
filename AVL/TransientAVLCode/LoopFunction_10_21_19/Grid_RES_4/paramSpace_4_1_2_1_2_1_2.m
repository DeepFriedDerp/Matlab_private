function [aeroForces] = paramSpace_4_1_2_1_2_1_2(sailStates,airStates)

	CL = (5.709722)*sailStates.alpha + (-0.328419)*sailStates.beta + (-2.291620)*sailStates.p + (27.057348)*sailStates.q + (-1.277289)*sailStates.r + (0.008958)*sailStates.de;
	CD = -2.013170;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.819202)*sailStates.p + (0.000001)*sailStates.q + (0.162949)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.712040)*sailStates.alpha + (0.324097)*sailStates.beta + (-1.147829)*sailStates.p + (8.330010)*sailStates.q + (-1.418626)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-16.600319)*sailStates.alpha + (1.328464)*sailStates.beta + (9.586689)*sailStates.p + (-133.820877)*sailStates.q + (4.138404)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.564718)*sailStates.alpha + (-0.094203)*sailStates.beta + (2.062246)*sailStates.p + (-9.976465)*sailStates.q + (-0.082677)*sailStates.r + (-0.000165)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end