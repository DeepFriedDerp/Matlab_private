function [aeroForces] = paramSpace_4_4_2_1_2_1_2(sailStates,airStates)

	CL = (5.709722)*sailStates.alpha + (0.328419)*sailStates.beta + (-2.291620)*sailStates.p + (27.057341)*sailStates.q + (-1.277290)*sailStates.r + (0.008958)*sailStates.de;
	CD = -2.013170;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.819202)*sailStates.p + (0.000001)*sailStates.q + (0.162949)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.546224)*sailStates.alpha + (0.491754)*sailStates.beta + (-1.053440)*sailStates.p + (7.142129)*sailStates.q + (-1.437359)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-16.600321)*sailStates.alpha + (-1.328463)*sailStates.beta + (9.586689)*sailStates.p + (-133.820877)*sailStates.q + (4.138403)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.642893)*sailStates.alpha + (-0.068080)*sailStates.beta + (2.043471)*sailStates.p + (-9.740181)*sailStates.q + (-0.078951)*sailStates.r + (-0.000165)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end