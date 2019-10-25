function [aeroForces] = paramSpace_1_1_3_3_1_3_2(sailStates,airStates)

	CL = (4.064032)*sailStates.alpha + (0.014189)*sailStates.beta + (-2.454997)*sailStates.p + (32.801109)*sailStates.q + (-0.077530)*sailStates.r + (0.010302)*sailStates.de;
	CD = -0.145860;
	CY = (-0.058340)*sailStates.alpha + (-0.023714)*sailStates.beta + (0.205112)*sailStates.p + (-0.491626)*sailStates.q + (0.036120)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.323128)*sailStates.alpha + (-0.087520)*sailStates.beta + (-1.203444)*sailStates.p + (9.778846)*sailStates.q + (0.139861)*sailStates.r + (0.000474)*sailStates.de;
	Cm = (-14.934238)*sailStates.alpha + (-0.148142)*sailStates.beta + (8.806437)*sailStates.p + (-135.234573)*sailStates.q + (0.284558)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.307030)*sailStates.alpha + (-0.020711)*sailStates.beta + (-0.619122)*sailStates.p + (3.722950)*sailStates.q + (-0.047277)*sailStates.r + (0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end