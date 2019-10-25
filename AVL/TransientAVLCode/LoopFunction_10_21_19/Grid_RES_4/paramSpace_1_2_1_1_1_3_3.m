function [aeroForces] = paramSpace_1_2_1_1_1_3_3(sailStates,airStates)

	CL = (6.102597)*sailStates.alpha + (0.099858)*sailStates.beta + (-3.210133)*sailStates.p + (34.414585)*sailStates.q + (1.334436)*sailStates.r + (0.009369)*sailStates.de;
	CD = -2.398430;
	CY = (0.258824)*sailStates.alpha + (-0.023806)*sailStates.beta + (0.947521)*sailStates.p + (-1.002333)*sailStates.q + (0.188581)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (2.458657)*sailStates.alpha + (-0.408425)*sailStates.beta + (-1.854544)*sailStates.p + (14.664634)*sailStates.q + (1.440642)*sailStates.r + (0.001638)*sailStates.de;
	Cm = (-15.931648)*sailStates.alpha + (-0.364611)*sailStates.beta + (12.948825)*sailStates.p + (-161.102386)*sailStates.q + (-4.237749)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-0.660560)*sailStates.alpha + (-0.093994)*sailStates.beta + (-2.487079)*sailStates.p + (13.484444)*sailStates.q + (-0.135119)*sailStates.r + (0.000544)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end