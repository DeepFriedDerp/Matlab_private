function [aeroForces] = paramSpace_1_1_1_1_1_1_2(sailStates,airStates)

	CL = (4.162615)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.063779)*sailStates.p + (45.298912)*sailStates.q + (-2.544766)*sailStates.r + (0.011628)*sailStates.de;
	CD = -0.591390;
	CY = (-0.249123)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.807660)*sailStates.p + (-0.476204)*sailStates.q + (-0.201321)*sailStates.r + (-0.000101)*sailStates.de;

	Cl = (1.219717)*sailStates.alpha + (0.422540)*sailStates.beta + (-1.591369)*sailStates.p + (15.326284)*sailStates.q + (-2.082522)*sailStates.r + (0.001050)*sailStates.de;
	Cm = (-9.844337)*sailStates.alpha + (0.000000)*sailStates.beta + (8.671950)*sailStates.p + (-148.858078)*sailStates.q + (8.421315)*sailStates.r + (-0.067973)*sailStates.de;
	Cn = (0.853133)*sailStates.alpha + (0.105351)*sailStates.beta + (1.508449)*sailStates.p + (-4.802866)*sailStates.q + (-0.044623)*sailStates.r + (0.000007)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end